import 'dart:io';
import 'package:factory_teams/models/employee.dart';
import 'package:factory_teams/models/job.dart';
import 'package:factory_teams/models/location.dart';
import 'package:factory_teams/providers/auth_providers.dart';
import 'package:factory_teams/providers/isar_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../providers/service_providers.dart';

class IsarService{
  late final Ref _ref;
  late final String _dir =_ref.watch(providerDirectory) ;
  late Isar _isar;

  IsarService(Ref ref){
    print("constructor");
    _ref=ref;
  }


}