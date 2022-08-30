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

import '../../models/job.dart';
import '../../providers/service_providers.dart';

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
         ..role=row1['role']
         ..status=row1['status'];

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
  Future<List<int>> insertEmployee(String email,String psw,String name,double wage,int days,int norm,String role,String phone,String url,int jid) async{
    final userId= await insertUser(email, name, psw,role);
    if(userId == 0) {
      print('Error userId when insert employee');
      return [-1,-1];
    }

    final value = await _db.insert(table: 'employees', insertData: {
      'lid': ref.read(providerHiveService).getUser().id,
      'wage': wage,
      'vacation': days,
      'norm': norm,
      'uid' : userId,
      'jid': jid,
      'phone': phone,
      'url': url,
    });
    return [userId,value];
  }
  Future<int> insertJob(
      int nrShiftsWeekday,
      int nrShiftsWeekend, int shiftsWeekdayLength,
      int shiftsWeekendLength, int minPeopleEvening,
      int minPeopleMorning, int minPeopleNight,
      String title, int nrWeekdays, int nrWeekendDays,
      int timeShift1,int timeShift2,int timeShift3,int uid) async{
    int value = 0;

       value =await _db.insert(table: 'jobs', insertData: {
         'lid': uid,
         'title': title,
         'nr_shifts_weekdays': nrShiftsWeekday,
         'nr_shifts_weekend': nrShiftsWeekend,
         'lenght_shifts_weekdays': shiftsWeekdayLength,
         'lenght_shifts_weekend': shiftsWeekendLength,
         'min_people_shift1': minPeopleMorning,
         'min_people_shift2': minPeopleEvening,
         'min_people_shift3': minPeopleNight,
         'nr_weekdays': nrWeekdays,
         'nr_weekenddays': nrWeekendDays,
         'time_start_shift1': timeShift1,
         'time_start_shift2': timeShift2,
         'time_start_shift3': timeShift3,
      });

    return value;
  }
  Future<List> adminGetAllLocation() async{
    List loc = await _db.getAll(table: 'users',
    fields: 'uid,email,name,password',
      where: 'role = \'location\''
    );

    return loc;
  }
  Future<List> getJobsForLocation(int locId)async{
    List jobs= await _db.getAll(table: 'jobs',
    where: {
      'lid' : ['=',locId],
    });
    return jobs;
  }
  Future<List> getEmployeesForLocation(int locId)async{
    List emp= await _db.getAll(table: 'employees tb1,users tb2',
    fields: 'tb1.*,tb2.name',
    where: {
      'tb1.lid' : ['=',locId],
      'tb1.uid' : ['=','tb2.uid']
    }
    );
    return emp;
  }

  Future<int> updatePass(String password, int id) async {
    var resp = await _db.update(
        table: 'users',
        updateData: {'password' : password, 'status': 'confirmed'},
        where: {'uid' : id} );
    return resp;
  }

  Future getEmployee(int uid) async {
    var row1 = await _db.getOne(
      table: 'employees',
      fields: '*',
      where: {
        'uid': uid,
      },
      debug: true,);
    return row1;
  }

  Future getJob( int jid) async{
    var row1 = await _db.getOne(
      table: 'jobs',
      fields: '*',
      where: {
        'jid': jid,
      },
      debug: true,);
    return row1;
  }
  Future getCurrentDate() async{
    var row1 = await _db.query('Select * from calendar where curdate() > start_date and curdate() < end_date');
    return row1.rows.first;
  }

  Future<int> addPreference(int week1, int week2, int week3, int week4, int weekend1, int weekend2, int weekend3, int weekend4, int cid, int uid, int jid) async {
    return await _db.insert(table: 'preferences', insertData: {
      'uid': uid,
      'jid': jid,
      'week1': week1,
      'week2': week2,
      'week3': week3,
      'week4': week4,
      'weekend1': weekend1,
      'weekend2': weekend2,
      'weekend3': weekend3,
      'weekend4': weekend4,
      'cid': cid,
    });
  }

  Future getpref(int uid, int cid) async {
    var row1 = await _db.getOne(
    table: 'preferences',
    fields: '*',
    order: 'pid desc',
    where: {
      'uid': uid,
      'cid': cid,
    },
    debug: true,);
  return row1;}

  Future addRequest( String reqDate1,  String reqDate2,String status ,int lid, int jid, int uid) async {

  return await _db.insert(table: 'requests', insertData: {
  'uid': uid,
  'jid': jid,
  'startdate': reqDate1,
  'enddate': reqDate2,
  'status': status,
  'lid': lid,
  });

  }
  Future getrequestsEmploye(int uid) async {
    return await  _db.getAll(table: 'requests',
        where: {
          'uid' : ['=',uid],
        });
  }
  Future getrequestsLocation(int lid) async {
    return await  _db.getAll(table: 'requests',
        where: {
          'lid' : ['=',lid],
        });
  }

  void updateRequest(int rid, String s) {
    _db.update(table: 'requests', updateData: {'status':s}, where: {'rid':rid});
  }

}