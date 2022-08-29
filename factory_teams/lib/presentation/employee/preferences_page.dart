import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/service_providers.dart';
import '../../services/widgets.dart';
import 'navigation_drawer_widget.dart';

class PreferencePage extends ConsumerStatefulWidget {

  const PreferencePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PreferencePageState();
}

class _PreferencePageState extends ConsumerState<PreferencePage> {
  late int week1;
  late int week2;
  late int week3;
  late int week4;

  void updateWeek1(String s,WidgetRef ref) {
    week1=int.parse(s);
  }
  void  updateWeek2(String s,WidgetRef ref) {
    week2=int.parse(s);
  }
  void  updateWeek3(String s,WidgetRef ref) {
    week3=int.parse(s);
  }
  void  updateWeek4(String s,WidgetRef ref) {
    week4=int.parse(s);
  }


  init() async {

  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        centerTitle: true,
        title: Text('Hello ${ref.read(providerHiveService).getUser().name}'

        ),
      ),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextField('Choose shift week1 (1/2/3)', updateWeek1, false,TextInputType.number),
                customTextField('Choose shift week2 (1/2/3)', updateWeek2, false,TextInputType.number),
                customTextField('Choose shift week3 (1/2/3)', updateWeek3, false,TextInputType.number),
                customTextField('Choose shift week4 (1/2/3)', updateWeek4, false,TextInputType.number),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(15)),
                  child: ElevatedButton(
                    onPressed: () async{

                      String response= await ref.read(providerEmployeeServices).addPreference(week1,week2,week3,week4);
                      // ignore: use_build_context_synchronously
                      if(response.isNotEmpty) {
                        showMyDialog(context, "Registration error", response);
                      } else {
                        showMyDialog(context, "Registration Successful", 'Location was added');
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
        ),
      ),
    );
  }
}