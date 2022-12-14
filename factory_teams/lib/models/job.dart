import 'package:factory_teams/models/employee.dart';
import 'package:isar/isar.dart';

class Job{
  late int jid;
  late String Title;
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
  late int timeShift1;
  late int timeShift2;
  late int timeShift3;

  @override
  String toString() {
    return 'Job{jid: $jid, Title: $Title, lid: $lid, nrShiftsWeekday: $nrShiftsWeekday, nrShiftsWeekdend: $nrShiftsWeekdend, lengthShiftsWeekday: $lengthShiftsWeekday, lengthShiftsWeekend: $lengthShiftsWeekend, minPeopleShift1: $minPeopleShift1, minPeopleShift2: $minPeopleShift2, minPeopleShift3: $minPeopleShift3, nrWeekdays: $nrWeekdays, nrWeekends: $nrWeekends, timeShift1: $timeShift1, timeShift2: $timeShift2, timeShift3: $timeShift3}';
  }
}