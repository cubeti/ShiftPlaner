import 'package:factory_teams/providers/auth_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import '../providers/encrypt_providers.dart';
import '../providers/service_providers.dart';

class UserServices {

  late final Ref ref;

  UserServices(Ref providers) {
    ref = providers;
  }

  Future<String> logIn(String email, String password) async {
    print("loging in $password");
    print(ref.read(providerEncryptionService).encrypt(password));
    User? user = await ref.read(providerSqlService).getUser(email: email);
    if (user == null) {
      return "User not found";
    }
    if (user.password !=
        ref.read(providerEncryptionService).encrypt(password)) {
      return "Wrong credentials";
    }
      print("Correct user");
      await ref.read(providerHiveService).setUser(user);
      return '';

  }
  
}