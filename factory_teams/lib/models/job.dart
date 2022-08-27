import 'package:factory_teams/models/employee.dart';
import 'package:isar/isar.dart';
part 'job.g.dart';
@Collection()
class Job{
  @Id()
  int? id;

  @Index()
  late String Title;

  @Index()
  late int lid;//location link
  late int nrShiftsWeekday;
  late int nrShiftsWeekdend;
  late int lengthShiftsWeekday;
  late int lengthShiftsWeekend;
  late int minPeopleShift1;
  late int minPeopleShift2;
  late int minPeopleShift3;
  late int nrWeekdays;
  late int nrWeekends;

  final employees = IsarLinks<Employee>;
}