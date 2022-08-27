import 'dart:io';
import 'package:factory_teams/models/employee.dart';
import 'package:factory_teams/models/job.dart';
import 'package:factory_teams/models/location.dart';
import 'package:factory_teams/providers/auth_providers.dart';
import 'package:factory_teams/providers/isar_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService{
  late final Ref _ref;
  late final String _dir =_ref.watch(providerDirectory) ;
  late Isar _isar;

  IsarService(Ref ref){
    print("constructor");
    _ref=ref;
  }

  Future<void> init() async{
    print("init");
    try {
      _isar = await Isar.open(
          schemas: [LocationSchema, JobSchema, EmployeeSchema],
          directory: _dir);
    }
    catch (e){
      print('Got error');
      print(e);
    }
    print('Isar is opne${_isar.isOpen}');
  }
  Future<void> insertLoc(int id,String email,String name,String psw,String role)async
  {
    await _isar.writeTxn(
            (isar) async {
              await isar.locations.put(
                  Location()
                    ..email = email
                    ..id= id
                    ..name=name
                    ..password=psw
              );
        }
    );
  }
  Future<void> saveEmployee(int lid) async {
    List _s= await _ref.watch(providerSqlService).getEmployeesForLocation(lid);
    for (var element  in _s) {
      var map = element as Map<String,dynamic>;
      var emp = Employee()
        ..lid = map['lid']
        ..id= map['eid']
        ..salary=map['wage']
        ..nrVacationDays=map['vacation']
      ..norm=map['norm']
      ..uid=map['uid']
      ..jobtitle=map['jobtitle']
      ..phone=map['phone']
      ..url=map['url'];
      await _isar.writeTxn(
              (isar) async {
            await isar.employees.put(emp);
          }
      );
    }
  }
  Future <List<Employee>>getEmployees()async{
    List<Employee> emp= [];
    await saveEmployee(_ref.read(providerHiveService).getUser().id);
    emp= await _isar.employees.where().findAll();
    return emp;
  }
  Future<int> getNumber(String title,int id)async{
    Job x = await _isar.jobs.filter().idEqualTo(id).findFirst() ?? Job();
    int req= x.minPeopleShift1 +x.minPeopleShift2+x.minPeopleShift3;
    int ppl= await _isar.employees.filter().jobtitleEqualTo(x.Title).count();
    return ppl-req;
  }

  Future<void> deleteUser(int uid)async{
    await _isar.writeTxn((isar) async {
      await isar.locations.delete(uid);
    });
    await _ref.read(providerSqlService).delete(uid);
  }

  Future<List<Location>> getAllLocation()async{
    List<Location> _l = await _isar.locations.where().findAll();

    return _l;
  }

  Future<void> saveLocations(WidgetRef ref)async{
    List _s=await ref.read(providerSqlService).adminGetAllLocation();

    for (var element  in _s) {
     var map = element as Map<String,dynamic>;
     var location = Location()
       ..email = map['email']
       ..id= map['uid']
        ..name=map['name']
      ..password=map['password'];
     await _isar.writeTxn(
             (isar) async {
               await isar.locations.put(location);
             }
     );
   }
  }
  Future <List<Job>> getJobs(int id) async{
    List jobs = await _ref.read(providerSqlService).getJobsForLocation(id);
    await _saveJobs(jobs, id);
    return _isar.jobs.where().findAll();
  }
  Future <List<Job>> readJobs()async{
    return _isar.jobs.where().findAll();
  }
  Future<void> _saveJobs(List sql,int id)async {
    int lid = _ref.read(providerHiveService).getUser().id;
    Map<String, dynamic> map;
    Job job;
      for(var element in sql){
        map = element as Map<String,dynamic>;
        job=Job()
          ..id=map['jid']
          ..lid=lid
          ..nrShiftsWeekday=map['nr_shifts_weekdays']
          ..nrShiftsWeekdend=map['nr_shifts_weekend']
          ..nrWeekdays=map['nr_weekdays']
          ..nrWeekends=map['nr_weekenddays']
          ..lengthShiftsWeekday=map['lenght_shifts_weekdays']
          ..lengthShiftsWeekend=map['lenght_shifts_weekend']
          ..minPeopleShift1=map['min_people_shift1']
          ..minPeopleShift2=map['min_people_shift2']
          ..minPeopleShift3=map['min_people_shift3']
          ..Title=map['title'];
        await _isar.writeTxn(
                (isar) async {
              await isar.jobs.put(job);
            }
        );
      }
  }
  Future<List<String>> getAllJobsTitle() async{
    List<String> _s = [];
    List<Job> j=await readJobs();
    _s=[for (Job job in j)  job.Title];
    return _s;
}
}