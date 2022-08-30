import 'package:factory_teams/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/registration_providers.dart';
import '../providers/service_providers.dart';
import '../services/widgets.dart';
import 'admin/admin_page.dart';
import 'employee/employee_page.dart';
import 'location/location_page.dart';

class PasswordChangePage extends ConsumerStatefulWidget {
  const PasswordChangePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends ConsumerState<PasswordChangePage> {



  String pass = '';
  String passConfirm = '';


  void updatePsw1(String s, WidgetRef ref) {
    pass = s;
  }

  void updatePsw2(String s, WidgetRef ref) {
    passConfirm = s;
  }
  @override
  Widget build(BuildContext context) {
    // use ref to listen to a provider

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text('On first login change password!'),
        centerTitle: true,
      ),
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField('Password', updatePsw1, true,TextInputType.text),
            customTextField('ConfirmPassword', updatePsw2, true,TextInputType.text),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(15)),
              child: ElevatedButton(
                onPressed: () async{

                  String response= await ref.read(providerAdminServices).updatePassword(
                      pass,
                      passConfirm);

                  if(!mounted) return;

                  if(response.isNotEmpty) {
                    showMyDialog(context, "Registration error", response);
                    return;
                  }

                  await showMyDialog(context, "Update successful", 'password changed');

                  if(!mounted) return;

                  switch(ref.read(providerHiveService).getUser().role){
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
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

