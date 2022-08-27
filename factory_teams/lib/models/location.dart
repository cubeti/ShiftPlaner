

import 'package:isar/isar.dart';

import 'job.dart';
part 'location.g.dart';

@Collection()
@Name('loc')
class Location{
  @Id()
  int? id;

  late String password;
  late String name;

  late String email;

  final jobs = IsarLinks<Job>();

}