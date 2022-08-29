import 'package:factory_teams/adapters/hive/HiveService.dart';
import 'package:factory_teams/adapters/database/isar_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final providerDirectory = StateProvider<String>((_) => '');

