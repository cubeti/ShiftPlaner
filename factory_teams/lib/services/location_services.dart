import 'package:factory_teams/models/calendar.dart';
import 'package:factory_teams/models/employee.dart';
import 'package:factory_teams/models/preference.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/job.dart';
import '../models/request.dart';
import '../providers/registration_providers.dart';
import '../providers/service_providers.dart';
import '../providers/sql_providers.dart';

class LocationService{
  List<Employee> employees = [];
  List<Request> requests = [];
  List<Job> jobs = [];
  List<Preference> prefs = [];
  Calendar calendar = Calendar();
  late Ref ref ;
  LocationService(Ref reference){
    ref= reference;
  }
  Future<void> setEmployees(int lid) async {
    employees.clear();
    List s= await ref.watch(providerSqlService).getEmployeesForLocation(lid);
    for (var element  in s) {
      var map = element as Map<String,dynamic>;
      var emp = Employee()
        ..lid = map['lid']
        ..eid= map['eid']
        ..salary=map['wage']
        ..nrVacationDays=map['vacation']
        ..norm=map['norm']
        ..uid=map['uid']
        ..jid=map['jid']
        ..phone=map['phone']
        ..url=map['url']
      ..name=map['name']??'testname';
      employees.add(emp);
    }
    return;
  }
  List<Employee>getEmployees(){
    return employees;
  }
  int getNumber(int jid){
    Job x=Job();
    for(var job in jobs){
      if(job.jid==jid){
        x=job;
      }
    }
    int req= x.minPeopleShift1 +x.minPeopleShift2+x.minPeopleShift3;
    Iterable<Employee> ppl= employees.where((element) => element.jid ==jid);
    return ppl.length-req;
  }

  List<Job> getJobs() {
    return jobs;
  }
  Future<void> setJobs(int id)async {

    await setCalendar();
    await getPreferencesLocation(calendar.cid);
    jobs.clear();
    List sql = await ref.read(providerSqlService).getJobsForLocation(id);
    int lid = ref.read(providerHiveService).getUser().id;
    Map<String, dynamic> map;
    Job job;
    for(var element in sql){
      map = element as Map<String,dynamic>;
      job=Job()
        ..jid=map['jid']
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
      jobs.add(job);
    }
  }
  List<String> getAllJobsTitle(){
    List<String> s = [];
    List<Job> j=jobs;
    s=[for (Job job in j)  job.Title];
    return s;
  }
  List<int> getNumberPeople(){
    List<int> list = [];

    list=[for (Job job in jobs) getNumber(job.jid)];

    return list;
  }
  Future<int> addEmployee() async {
    print("job title is ${ref.read(providerDropdown)}");
    Job x = jobs.where(
            (element) => element.Title ==  ref.read(providerDropdown)
    ).first;
    final value = await ref.read(providerSqlService).insertEmployee(
        ref.read(providerRegistrationEmail),
        ref.read(providerRegistrationPassword),
        ref.read(providerRegistrationName),
        ref.read(providerRegistrationWage),
        ref.read(providerRegistrationVacationDays),
        ref.read(providerRegistrationNorm),
        ref.read(providerRegistrationRole),
        ref.read(providerRegistrationPhone),
        ref.read(providerRegistrationUrl),
        x.jid);
    employees.add(Employee()..phone=ref.read(providerRegistrationPhone)..jid=x.jid..url=ref.read(providerRegistrationUrl)..uid=value[0]..eid=value[1]);
    return 0;
  }
  Future<int> addJob(
      int nrShiftsWeekday,
      int nrShiftsWeekend, int shiftsWeekdayLength,
      int shiftsWeekendLength, int minPeopleEvening,
      int minPeopleMorning, int minPeopleNight,
      String title, int nrWeekdays, int nrWeekendDays,
      int timeShift1,int timeShift2,int timeShift3
      ) async{
    int uid=ref.read(providerHiveService).getUser().id;
    var jid=await ref.read(providerSqlService).insertJob(nrShiftsWeekday, nrShiftsWeekend, shiftsWeekdayLength, shiftsWeekendLength, minPeopleEvening, minPeopleMorning, minPeopleNight, title, nrWeekdays, nrWeekendDays, timeShift1, timeShift2, timeShift3,uid);
    Job job = Job()
      ..nrWeekdays=nrWeekdays
      ..nrWeekends=nrWeekendDays
    ..jid=jid
    ..lid= uid
    ..Title = title
    ..minPeopleShift1 = minPeopleMorning
    ..minPeopleShift2 = minPeopleEvening
    ..minPeopleShift3 = minPeopleNight
    ..lengthShiftsWeekday = shiftsWeekdayLength
    ..lengthShiftsWeekend = shiftsWeekendLength
    ..timeShift1 = timeShift1
    ..timeShift2 = timeShift2
    ..timeShift3= timeShift3;
    jobs.add(job);
    return jid;
  }
  List<Request> getRequests(){
    return requests;
  }
  Future setRequests() async {
    requests = [];
   var req = await ref.read(providerSqlService).getrequestsLocation(ref.read(providerHiveService).getUser().id);
    for (var element  in req) {
      var map = element as Map<String, dynamic>;
      var tmp = Request()
        ..rid = map['rid']
        ..uid = map['uid']
        ..jid = map['jid']
        ..lid = map['lid']
        ..status = map['status']
        ..startDate = map['startdate']
        ..endDate = map['enddate'];
      requests.add(tmp);
    }
    requests.toString();
    return;
  }
  Future setCalendar() async {
    var x = await ref.read(providerSqlService).getCurrentDate();
    print(x.toString());
    x = x as Map<String , dynamic >;
    calendar = Calendar()..cid=x['cid']..endDate=x['end_date']..startDate=x['start_date'];
    return;
  }
  void updateRequest(int index,int rid, String s) {
    ref.read(providerSqlService).updateRequest(rid,s);
    requests[index].status=s;
  }
  Future getPreferencesLocation(int cid) async {
    List<Preference> list = [];
    var req = await ref.read(providerSqlService).getprefLocation(
        ref.read(providerHiveService).getUser().id,
        cid);
    for (var element  in req) {
      var map = element as Map<String, dynamic>;
      var tmp = Preference()
        ..pid = map['pid']
        ..uid = map['uid']
        ..jid = map['jid']
        ..cid = map['cid']
        ..week1 = map['week1']
        ..week2 = map['week2']
        ..week3 = map['week3']
        ..week4 = map['week4']
        ..weekend1 = map['weekend1']
        ..weekend2 = map['weekend2']
        ..weekend3 = map['weekend3']
        ..weekend4 = map['weekend4'];
      list.add(tmp);
    }
     prefs = list;
    return;
  }
   generateSchedule(int cid,int jid) {
   List<Preference> preferences =  prefs.where((element) => element.jid == jid).toList();
   Map<int,Preference> prefMap = {for (Preference x in preferences) x.uid : x };
   List<Employee> y = employees.where((element) => element.jid == jid).toList();
   Map<int,Employee> empMap= {for (Employee elem in y) elem.uid : elem };
  }
}