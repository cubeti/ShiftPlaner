import 'package:factory_teams/services/employee_services.dart';
import 'package:factory_teams/services/location_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../adapters/hive/HiveService.dart';
import '../services/admin_service.dart';

final providerAdminServices = Provider((ref) => AdminService(ref));
final providerHiveService = Provider((ref) => HiveService(ref));
final providerLocationServices = Provider((ref) => LocationService(ref));
final providerEmployeeServices = Provider((ref) => EmployeeService(ref));