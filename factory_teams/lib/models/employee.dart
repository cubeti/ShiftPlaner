import 'package:isar/isar.dart';



class Employee{

  late int eid;


  late int lid; //link to location
  late int uid;

  late String url;
  late String phone;
  late int jid; // link to job

  late double salary; //
  late int nrVacationDays;
  late int norm;
  late String name;

  @override
  String toString() {
    return 'Employee{eid: $eid, lid: $lid, uid: $uid, url: $url, phone: $phone, jid: $jid, salary: $salary, nrVacationDays: $nrVacationDays, norm: $norm, name: $name}';
  }
}