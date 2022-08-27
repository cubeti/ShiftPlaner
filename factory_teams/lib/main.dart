import 'package:factory_teams/presentation/admin/admin_page.dart';
import 'package:factory_teams/presentation/employee/employee_page.dart';
import 'package:factory_teams/presentation/location/location_page.dart';
import 'package:factory_teams/providers/auth_providers.dart';
import 'package:factory_teams/providers/encrypt_providers.dart';
import 'package:factory_teams/providers/isar_providers.dart';
import 'package:factory_teams/adapters/database/sql_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:path_provider/path_provider.dart';

import 'presentation/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");


  runApp( ProviderScope(
      child: AuthentificationWrapper())
  );
}


class AuthentificationWrapper extends StatelessWidget {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  const AuthentificationWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: AuthChecker(),

   );
  }
}

class AuthChecker extends ConsumerStatefulWidget {
  const AuthChecker({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends ConsumerState<AuthChecker> {
  void init(WidgetRef ref) async {
    final x=await getApplicationSupportDirectory();
    print('path_var is ${x.path}');
    ref.read(providerDirectory.notifier).state = x.path;
    await ref.read(providerIsarService).init();
    await ref.read(providerHiveService).init();
    var isUser =  ref.read(providerHiveService).checkUser();
    if(isUser) {
      ref.read(providerLogInStatus.notifier)
        .state = ref.read(providerHiveService).getUser().role;
    }

  }
  @override
  void initState() {
    init(ref);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final authState = ref.watch(providerLogInStatus);
    print(ref.read(providerEncryptionService).decrypt('AsHG5ojjsHW3kkPVQMr+KQ=='));
    if(authState == ''){
      return LoginPage();
    }
    else
    {
      switch(authState){
        case 'admin':
          return AdminPage();
        case 'location':
          return LocationPage();
        case 'employee':
          return EmployeePage();
      }
      return Container();
    }

  }
}

