
import 'package:factory_teams/presentation/welcome_page.dart';

import 'package:factory_teams/providers/service_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/user.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env").then((value) {print("dotenv ok");}).
  onError((error, stackTrace) {print("dotenv error");}).whenComplete(() {print("dotenv done");});


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

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

   return FutureBuilder(
      future: ref.read(providerHiveService).init(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        Widget child;
        if (snapshot.hasData) {
          child = WelcomePage();

        } else if (snapshot.hasError) {
          child = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ],
          );

        } else {
          child = Scaffold(
            backgroundColor: Colors.deepPurple[200],
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Loading...'),
                  )
                ],
              ),
            ),
          );
        }
        return child;
      },
    );
  }
}

