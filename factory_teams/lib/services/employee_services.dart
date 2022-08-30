import 'package:factory_teams/models/preference.dart';
import 'package:factory_teams/providers/service_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/calendar.dart';
import '../models/employee.dart';
import '../models/job.dart';
import '../models/user.dart';

class EmployeeService{
  late Preference preference;
  late Calendar cal;
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
    print(emp.toString());
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
      ..Title=jobData['title']
    ..timeShift1=jobData['time_start_shift1']
    ..timeShift2=jobData['time_start_shift2']
    ..timeShift3=jobData['time_start_shift3'];
    print(job.toString());
    var x = await ref.read(providerSqlService).getCurrentDate();
    print(x.toString());
    x = x as Map<String , dynamic >;
    cal = Calendar()..cid=x['cid']..endDate=x['end_date']..startDate=x['start_date'];
    print(cal.toString());

    preference = Preference();
    var pref = await ref.read(providerSqlService).getpref(user.id,cal.cid+1);
    if(pref.isNotEmpty) {
      preference=Preference()
          ..jid=pref['jid']
          ..cid=pref['cid']
          ..uid=pref['uid']
          ..pid=pref['pid']
          ..week1=pref['week1']
          ..week2=pref['week2']
          ..week3=pref['week3']
          ..week4=pref['week4']
          ..weekend1=pref['weekend1']
          ..weekend2=pref['weekend1']
          ..weekend3=pref['weekend1']
          ..weekend4=pref['weekend1'];
    }
    print(preference.toString());

  }

  Future addPreference(int week1, int week2, int week3, int week4 ,
      int weekend1,int weekend2,int weekend3,int weekend4)  async {
    int val= await ref.read(providerSqlService).addPreference( week1,  week2,  week3,  week4 ,
           weekend1, weekend2, weekend3, weekend4 , cal.cid+1,user.id,job.jid);
    if(val > 0){
      preference=Preference()
        ..jid=user.id
        ..cid=cal.cid+1
        ..uid=user.id
        ..pid=val
        ..week1=week1
        ..week2=week2
        ..week3=week3
        ..week4=week4
        ..weekend1=weekend1
        ..weekend2=weekend2
        ..weekend3=weekend3
        ..weekend4=weekend4;
    }
    return val;
  }

  Preference getPreference() {
    return preference;
  }
}