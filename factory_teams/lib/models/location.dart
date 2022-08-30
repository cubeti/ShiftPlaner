

import 'package:isar/isar.dart';

import 'job.dart';

class Location{
  late int id;
  late String password;
  late String name;
  late String email;

  @override
  String toString() {
    return 'Location{id: $id, password: $password, name: $name, email: $email}';
  }
}