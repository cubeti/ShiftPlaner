import 'package:isar/isar.dart';



class Employee{

  late int eid = 0;


  late int lid = 0; //link to location
  late int uid =0;

  late String url = '';
  late String phone = '';
  late int jid = 0; // link to job

  late double salary = 0.0; //
  late int nrVacationDays = 0;
  late int norm = 0;
  late String name = '';

  @override
  String toString() {
    return 'Employee{eid: $eid, lid: $lid, uid: $uid, url: $url, phone: $phone, jid: $jid, salary: $salary, nrVacationDays: $nrVacationDays, norm: $norm, name: $name}';
  }
}