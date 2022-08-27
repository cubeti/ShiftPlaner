import 'package:factory_teams/providers/auth_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:factory_teams/services/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  void updateEmail(BuildContext context, String email, WidgetRef ref) {
    ref.read(providerLogInEmail.notifier).state = email;
  }

  void updatePassword(BuildContext context, String pass, WidgetRef ref) {
    ref.read(providerLogInPassword.notifier).state = pass;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String>(providerLogInErrors, (previous, next) {
      if(next != '') {
        showDialogFunction(context,ref.read(providerLogInErrors) ?? "Blank");
      }
    });
    final email = ref.watch(providerLogInEmail);
    final password = ref.watch(providerLogInPassword);
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
                onPressed: () => ref.read(providerUserServices).logIn(email, password),
                child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 25),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
