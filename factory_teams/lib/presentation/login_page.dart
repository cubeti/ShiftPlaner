
import 'package:factory_teams/providers/auth_providers.dart';
import 'package:factory_teams/providers/service_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:factory_teams/services/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import 'admin/admin_page.dart';
import 'change_password_page.dart';
import 'employee/employee_page.dart';
import 'location/location_page.dart';
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  String pass = '';
  String email = '';

  void updateEmail(BuildContext context, String email, WidgetRef ref) {
    this.email = email;
  }
  void updatePassword(BuildContext context, String password, WidgetRef ref) {
    pass = password;
    print("pass is $pass");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
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
              child: TextField(
                showCursor: true,
                onChanged: (value) => updateEmail(context, value, ref),
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                onChanged: (value) => updatePassword(context, value, ref),
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,borderRadius: BorderRadius.circular(15)
              ),
              child: ElevatedButton(
                onPressed: () async {
                  String response = await ref.read(providerUserServices).logIn(email, pass);

                  if(!mounted) return;

                  if( response.isNotEmpty) {

                    showMyDialog(context, 'Error', response);
                    return ;
                  }

                  User user = ref.read(providerHiveService).getUser();

                  if(user.status == 'new') {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PasswordChangePage() ));
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
                child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 25),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
