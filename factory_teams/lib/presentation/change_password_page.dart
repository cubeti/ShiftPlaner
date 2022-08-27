import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/registration_providers.dart';
import '../services/widgets.dart';
class PasswordChangePage extends ConsumerWidget {
  PasswordChangePage({Key? key}) : super(key: key);

  String pass = '';
  String passConfirm = '';


  void updatePsw1(String s, WidgetRef ref) {
    pass = s;
  }

  void updatePsw2(String s, WidgetRef ref) {
    passConfirm = s;
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // use ref to listen to a provider

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text('Change password'),
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
                  // ignore: use_build_context_synchronously
                  if(response.isNotEmpty) showMyDialog(context, "Registration error", response);

                  // ignore: use_build_context_synchronously
                  showMyDialog(context, "Update successful", 'password changed');
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

