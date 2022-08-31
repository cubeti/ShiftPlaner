import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/service_providers.dart';
import '../login_page.dart';

class SchedulesPage extends ConsumerStatefulWidget {


  const SchedulesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends ConsumerState<SchedulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){

            ref.read(providerHiveService).deleteUser();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage() ));

          },
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.deepPurple[200],
        actions: [
          IconButton(onPressed:
              (){

          },
              icon: Icon(Icons.add)
          )
        ],
        centerTitle: true,
        title: Text(
            'Schedules'
        ),
      ),
      body: Container(),
    );
  }
}
