import 'package:intl/intl.dart';

class Calendar
{
  final dateFormatter = DateFormat('yyyy-MM-dd');
  late int cid;
  late String startDate;
  late String endDate;

  @override
  String toString() {
    return 'Calendar{cid: $cid, startDate: $startDate, endDate: $endDate}';
  }
}