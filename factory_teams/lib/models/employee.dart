import 'package:isar/isar.dart';
part 'employee.g.dart';

@Collection()
class Employee{
  @Id()
  int? id;

  @Index(composite: [CompositeIndex('jobtitle')])
  late int lid; //link to location
  late int uid;

  late String url;
  late int phone;
  late String jobtitle; // link to job

  late double salary; //
  late int nrVacationDays;
  late int norm;
}