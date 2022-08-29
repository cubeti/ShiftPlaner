import 'package:factory_teams/adapters/hive/HiveService.dart';
import 'package:factory_teams/providers/registration_providers.dart';
import 'package:factory_teams/adapters/database/sql_service.dart';
import 'package:factory_teams/services/user_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mysql_utils/mysql_utils.dart';
final providerDbHost = StateProvider<String>((ref) {
  bool hasEnv = dotenv.isEveryDefined(['host']);
  if (hasEnv) {
    return dotenv.env['host']!;
  } else {
    print("no host in env");
    return '';
  }
});
final providerDbPassword = StateProvider<String>((ref) {
  bool hasEnv = dotenv.isEveryDefined(['password']);
  if (hasEnv) {
    return dotenv.env['password']!;
  } else {
    print("no password in env");
    return '';
  }
});
final providerSqlDb = Provider<MysqlUtils>((ref) {
  return MysqlUtils(
    settings: {
      'host': ref.watch(providerDbHost),
      'port': 3306,
      'user': 'admin',
      'password': ref.watch(providerDbPassword),
      'db': 'db',
      'maxConnections': 10,
      'secure': false,
      'prefix': '',
      'pool': false,
      'collation': 'utf8mb4_general_ci',
    },
    errorLog: (error) {
      print(error);
    },
    sqlLog: (sql) {
      print(sql);
    },
    connectInit: (db1) async {
      print('whenComplete');
    },
  );
});
final providerSqlService = Provider((ref) {
  return SqlService(ref.watch(providerSqlDb),ref);
});

final providerUserServices = Provider((ref) => UserServices(ref));

final providerInsertUser = FutureProvider<int>((ref) async {
  final value = await ref.watch(providerSqlService)
              .insertUser(ref.watch(providerRegistrationEmail), ref.watch(providerRegistrationName), ref.watch(providerRegistrationPassword),ref.watch(providerRegistrationRole));
  if(value == -1) return Future.error('error');
  return value;
});
