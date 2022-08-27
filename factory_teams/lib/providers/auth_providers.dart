import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerLogInStatus= StateProvider<String>((ref) => '');
final providerLogInEmail = StateProvider<String>((ref) => '');
final providerLogInName = StateProvider<String>((ref) => '');
final providerLogInErrors = StateProvider<String>((ref) => '');
final providerLogInPassword = StateProvider<String>((ref) => '');
final providerLogInId = StateProvider<int>((ref) {return 0;});