import 'package:factory_teams/services/admin_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerRegistrationEmail = StateProvider((ref) => '');
final providerRegistrationName = StateProvider((ref) => '');
final providerRegistrationPassword = StateProvider((ref) => '');
final providerRegistrationRole = StateProvider((ref) => '');
final providerRegistrationPasswordConfirm = StateProvider((ref) => '');
final providerRegistrationWage = StateProvider<double>((ref) => 0.0);
final providerRegistrationVacationDays = StateProvider<int>((ref) => 0);
final providerRegistrationPhone = StateProvider<int>((ref) => 0);
final providerRegistrationNorm = StateProvider<int>((ref) => 0);
final providerRegistrationJob = StateProvider((ref) => '');
final providerRegistrationUrl = StateProvider((ref) => '');


final providerJobsNrShiftsWeekday = StateProvider<int>((ref) => 0);
final providerJobsNrShiftsWeekend = StateProvider<int>((ref) => 0);
final providerJobsShiftsWeekdayLength = StateProvider<int>((ref) => 0);
final providerJobsShiftsWeekendLength = StateProvider<int>((ref) => 0);
final providerJobsMinPeopleMorning = StateProvider<int>((ref) => 0);
final providerJobsMinPeopleEvening = StateProvider<int>((ref) => 0);
final providerJobsMinPeopleNight = StateProvider<int>((ref) => 0);
final providerJobsTitle = StateProvider<String>((ref) => '');
final providerJobsNrWeekdays = StateProvider<int>((ref) => 0);
final providerJobsNrWeekends = StateProvider<int>((ref) => 0);

final providerAdminServices = Provider((ref) => AdminService(ref));