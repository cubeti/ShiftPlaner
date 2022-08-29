import 'package:factory_teams/providers/service_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/employee.dart';
import '../models/job.dart';
import '../models/user.dart';

class EmployeeService{
  late User user;
  late Ref ref ;
  late Employee emp;
  late Job job;
  EmployeeService(Ref reference){
    ref= reference;
  }
  Future<void> setData() async {
    user = ref.read(providerHiveService).getUser();
    var empData = await ref.read(providerSqlService).getEmployee(user.id);
    print("Got employee data from sql");
    var map =empData  as Map<String,dynamic>;
    emp=Employee()
      ..lid = map['lid']
      ..eid = map['eid']
      ..salary = map['wage']
      ..nrVacationDays =map ['vacation']
      ..norm = map['norm']
      ..uid = map['uid']
      ..jid = map['jid']
      ..phone = map['phone']
      ..url = map['url']
      ..name=user.name ;

    Map<String,dynamic> jobData = await ref.read(providerSqlService).getJob(emp.jid);
    print("Got job data from sql");
    job=Job()
      ..jid=jobData['jid']
      ..lid=jobData['lid']
      ..nrShiftsWeekday=jobData['nr_shifts_weekdays']
      ..nrShiftsWeekdend=jobData['nr_shifts_weekend']
      ..nrWeekdays=jobData['nr_weekdays']
      ..nrWeekends=jobData['nr_weekenddays']
      ..lengthShiftsWeekday=jobData['lenght_shifts_weekdays']
      ..lengthShiftsWeekend=jobData['lenght_shifts_weekend']
      ..minPeopleShift1=jobData['min_people_shift1']
      ..minPeopleShift2=jobData['min_people_shift2']
      ..minPeopleShift3=jobData['min_people_shift3']
      ..Title=jobData['title'];
  }

  addPreference(int week1, int week2, int week3, int week4) {}
}