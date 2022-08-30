class Request{
  late int rid;
  late String startDate;
   late String endDate;
  late int uid;
  late int jid;
  late int lid;
  late String status= 'new';
  late String name='testname';

  @override
  String toString() {
    return 'Request{rid: $rid, startDate: $startDate, endDate: $endDate, uid: $uid, jid: $jid, lid: $lid, status: $status}';
  }
}