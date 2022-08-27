import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User{

  @HiveField(0)
    late int id;

  @HiveField(1)
    late String email;

  @HiveField(2)
  late String password;

  @HiveField(3)
  late String name;

  @HiveField(4)
  late String role;

  @HiveField(5)
  late String status;
}