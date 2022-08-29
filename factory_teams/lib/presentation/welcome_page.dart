import 'package:factory_teams/presentation/login_page.dart';
import 'package:factory_teams/providers/service_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import '../providers/sql_providers.dart';
import 'admin/admin_page.dart';
import 'change_password_page.dart';
import 'employee/employee_page.dart';
import 'location/location_page.dart';

class WelcomePage extends ConsumerStatefulWidget {

  const WelcomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  late User user ;
  late bool isUser;
  @override
  Widget build(BuildContext context) {
    isUser = ref.read(providerHiveService).checkUser();
    user = ref.read(providerHiveService).getUser();
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 250,
                width: 250,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Image.asset('assets/logo.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Welcome to SP+",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "If you need an account contact alex.cubi123@gmail.com",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87
                  ),
                )
              ),
              SizedBox(height: 50,),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,borderRadius: BorderRadius.circular(15)
                ),
                child: ElevatedButton(
                  onPressed: ()  {
                    if(!isUser) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage() ));
                      return;
                    }
                    if(user.status == 'new') {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => PasswordChangePage() ));
                      return;
                    }
                    else{
                      switch(user.role){
                        case 'admin':
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => AdminPage() ));
                          break;
                        case 'location':
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LocationPage() ));
                          break;
                        case 'employee':
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => EmployeePage() ));
                          break;
                      }
                    }

                  },
                  child: const Text('Login page',style: TextStyle(color: Colors.white,fontSize: 25),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
