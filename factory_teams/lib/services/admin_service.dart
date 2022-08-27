
import 'package:factory_teams/providers/encrypt_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/isar_providers.dart';

import '../providers/regex_providers.dart';
import '../providers/registration_providers.dart';
import '../providers/sql_providers.dart';

class AdminService{

    late Ref providers;
    AdminService(Ref ref){
      providers=ref;
    }
    Future<String>addLocation(String email,String name,String password,String password2) async {

      if (providers.read(providerRegexEmail).hasMatch(email) == false) {
        return 'Wrong email format';
      }
      if (name.isEmpty) {
        return 'Name empty';
      }
      if (password.isEmpty) {
        return 'Password empty';
      }
      if(password.length < 6){
        return "Password too short: >0 6";
      }
      if (password != password2) {
        return 'Passwords mismatch';
      }
      final val= await providers.read(providerSqlService).insertUser(
          email, name, password, 'location');
      if(val <= 0) {
        if(val == 0) {
          return 'Email used';
        } else {
          return 'Sql error';
        }
      }
      else{
        providers.read(providerIsarService).insertLoc(val,email,
            name,
            password,
            'location');
        return 'Register $name Id $val';
      }
        return '';
    }
    Future<String> updatePassword(String pass,String pass2)async{
      if(pass.isEmpty || pass.length <6 ) return "Password mush be at least 6 chars";
      if(pass != pass2) return "Passwords mush match";

      int result = await providers.read(providerSqlService).updatePass(
           providers.read(providerEncryptionService).encrypt(pass),
           providers.read(providerHiveService).getUser().id);

      providers.read(providerHiveService).updateUserStatus();
      if(result != 1) return "SQL returned $result";
      return '';
    }
}