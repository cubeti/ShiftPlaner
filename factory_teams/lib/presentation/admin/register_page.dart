import 'package:factory_teams/services/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/registration_providers.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  void updateEmail(String s, WidgetRef ref) {
    ref.read(providerRegistrationEmail.notifier).state = s;
  }

  void updatePsw1(String s, WidgetRef ref) {
    ref.read(providerRegistrationPassword.notifier).state = s;
  }

  void updatePsw2(String s, WidgetRef ref) {
    ref.read(providerRegistrationPasswordConfirm.notifier).state = s;
  }

  void updateName(String s, WidgetRef ref) {
    ref.read(providerRegistrationName.notifier).state = s;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text('Add Location'),
        centerTitle: true,
      ),
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField('Email', updateEmail, false,TextInputType.text),
            customTextField('Name', updateName, false,TextInputType.text),
            customTextField('Password', updatePsw1, true,TextInputType.text),
            customTextField('ConfirmPassword', updatePsw2, true,TextInputType.text),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(15)),
              child: ElevatedButton(
                onPressed: () async{

                  String response= await ref.read(providerAdminServices).addLocation(ref.read(providerRegistrationEmail)
                      , ref.read(providerRegistrationName), ref.read(providerRegistrationPassword),
                      ref.read(providerRegistrationPasswordConfirm));
                  // ignore: use_build_context_synchronously
                  if(response.isNotEmpty) showMyDialog(context, "Registration error", response);

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
