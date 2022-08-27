import 'package:factory_teams/providers/auth_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import '../providers/encrypt_providers.dart';
import '../providers/isar_providers.dart';

class UserServices {

  late final Ref ref;

  UserServices(Ref providers) {
    ref = providers;
  }

  Future<void> logIn(String email, String password) async {
    print("loging in");
    print(ref.read(providerEncryptionService).encrypt(password));
    User? user = await ref.read(providerSqlService).getUser(email: email);
    if (user == null) {
      print("User not found");
      return;
    }
    if (user.password ==
        ref.read(providerEncryptionService).encrypt(password)) {
      print("Correct user");
      ref.read(providerLogInStatus.notifier).state = user.role;
      await ref.read(providerHiveService).setUser(user);
      return;
    }
  }
  
}