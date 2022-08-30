

import 'package:factory_teams/models/user.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  late final Ref _ref;
  late Box<User> userBox;
  HiveService(Ref ref){
    _ref = ref;
  }
  Future<String> init() async{
    final x=await getApplicationSupportDirectory();
     Hive.init(x.path);
     if(!Hive.isAdapterRegistered(1)){
       Hive.registerAdapter(UserAdapter());
     }

     print("Hive init");
    userBox = await Hive.openBox<User>('user');
    print("box init");
    return 'ok';
  }
  Future<void> setUser(User user) async {
    var box = await Hive.openBox<User>('user');
    if (await Hive.boxExists('user')){
      if ( box.isOpen){
        box.put('user', user);
      }
      else{
        print("Box is not open");
      }
    }
    else{
      print("Box is not created");
    }

  }
  void deleteUser(){
    userBox.delete('user');
  }
  bool checkUser()
  {
    if(userBox.isOpen) {
      return userBox.containsKey('user');
    } else {
      print("Box is not open");
      return false;
    }
  }
  User getUser(){
    return userBox.get('user') ?? User();
  }
  void updateUserStatus(){
    User tmp = getUser();
    tmp.status='confirmed';
    userBox.put('user', tmp);
  }
}