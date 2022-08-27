import 'dart:async';

import 'package:factory_teams/models/user.dart';
import 'package:factory_teams/providers/auth_providers.dart';
import 'package:factory_teams/providers/encrypt_providers.dart';
import 'package:factory_teams/providers/registration_providers.dart';
import 'package:factory_teams/services/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:flutter/material.dart';

import '../../providers/isar_providers.dart';

class SqlService {

  SqlService(this._db,this.ref);
  final MysqlUtils _db;
  final Ref ref;
  Future<User?> getUser({required String email}) async{
    var row1 = await _db.getOne(
          table: 'users',
           fields: '*',
           where: {
              'email': email,
           },
          debug: true,);
   if(row1.isEmpty){
      return null;
   }

   return User()
         ..id=row1['uid']
         ..password=row1['password']
         ..email=email
         ..name=row1['name']
         ..role=row1['role'];

  }
  Future<void> delete(int id)async{
     await _db.delete(table: 'users', where: {
       "uid": id
     });
  }
  Future<int> insertUser(String email,String name,String psw,String role)async{
    int value = 0;
    try {
      value = await _db.insert(table: 'users', insertData: {
        'email': email,
        'password': ref.read(providerEncryptionService).encrypt(psw),
        'name': name,
        'role': role,
        'status': 'new'
      });
    }
    catch (e){
      print(e.toString());
      return -1;
    }
    print("Inserted $email,$name returned $value");
    return value;
  }
  Future<int> insertEmployee(String email,String psw,String name,double wage,int days,int norm,String role,int phone,String url) async{
    final _userId= await insertUser(email, name, psw,role);
    if(_userId == -1) {
      print('Error userId when insert employee');
      return -1;
    }
    final value = await _db.insert(table: 'employees', insertData: {
      'lid': ref.read(providerLogInId),
      'wage': wage,
      'vacation': days,
      'norm': norm,
      'uid' : _userId,
      'jobtitle': ref.read(providerRegistrationJob),
      'phone': phone,
      'url': url,
      'status': 'new'
    });
    return value;
  }
  Future<int> insertJob() async{
    int _value = 0;
    try{
       _value =await _db.insert(table: 'jobs', insertData: {
         'lid': ref.read(providerHiveService).getUser().id,
         'title': ref.read(providerJobsTitle),
         'nr_shifts_weekdays': ref.read(providerJobsNrShiftsWeekday),
         'nr_shifts_weekend': ref.read(providerJobsNrShiftsWeekend),
         'lenght_shifts_weekdays': ref.watch(providerJobsShiftsWeekdayLength),
         'lenght_shifts_weekend': ref.watch(providerJobsShiftsWeekendLength),
         'min_people_shift1': ref.watch(providerJobsMinPeopleMorning),
         'min_people_shift2': ref.watch(providerJobsMinPeopleEvening),
         'min_people_shift3': ref.watch(providerJobsMinPeopleNight),
         'nr_weekdays': ref.watch(providerJobsNrWeekdays),
         'nr_weekenddays': ref.watch(providerJobsNrWeekends),
      });
    }catch(error){
      print('Got error on insert job:${error.toString()}');
      return -1;
    }
    return _value;
  }
  Future<List> adminGetAllLocation() async{
    List _loc = await _db.getAll(table: 'users',
    fields: 'uid,email,name,password',
      where: 'role = \'location\''
    );

    return _loc;
  }
  Future<List> getJobsForLocation(int locId)async{
    List _jobs= await _db.getAll(table: 'jobs',
    where: {
      'lid' : ['=',locId],
    });
    return _jobs;
  }
  Future<List> getEmployeesForLocation(int locId)async{
    List _emp= await _db.getAll(table: 'employees',
    where: {
      'lid' : ['=',locId],
    }
    );
    return _emp;
  }

  Future<int> updatePass(String password, int id) async {
    var resp = await _db.update(
        table: 'users',
        updateData: {'password' : password, 'status': 'confirmed'},
        where: {'uid' : id} );
    return resp;
  }


}