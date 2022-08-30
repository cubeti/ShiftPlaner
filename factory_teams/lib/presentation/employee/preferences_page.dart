import 'package:factory_teams/models/preference.dart';
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
  Preference pref = Preference();
  late int week1;
  late int week2;
  late int week3;
  late int week4;
  late int weekend1;
  late int weekend2;
  late int weekend3;
  late int weekend4;

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
  void updateWeekend1(String s,WidgetRef ref) {
    weekend1=int.parse(s);
  }
  void  updateWeekend2(String s,WidgetRef ref) {
    weekend2=int.parse(s);
  }
  void  updateWeekend3(String s,WidgetRef ref) {
    weekend3=int.parse(s);
  }
  void  updateWeekend4(String s,WidgetRef ref) {
    weekend4=int.parse(s);
  }



  init()  {
        pref= ref.read(providerEmployeeServices).getPreference();
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
        title: Text('Set pref for ${ref.read(providerHiveService).getUser().name} on month ${pref.cid}'

        ),
      ),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0,top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('W1: ${pref.week1}',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('W2: ${pref.week2}',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('W3: ${pref.week3}',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('W4: ${pref.week4}',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Wend1: ${pref.weekend1}',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Wend2: ${pref.weekend2}',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Wend3: ${pref.weekend3}',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Wend4: ${pref.weekend4}',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  customTextField('Choose shift week1 (1/2/3)', updateWeek1, false,TextInputType.number),
                  customTextField('Choose shift week2 (1/2/3)', updateWeek2, false,TextInputType.number),
                  customTextField('Choose shift week3 (1/2/3)', updateWeek3, false,TextInputType.number),
                  customTextField('Choose shift week4 (1/2/3)', updateWeek4, false,TextInputType.number),
                  customTextField('Choose shift weekend1 (0/1/2/3)', updateWeekend1, false,TextInputType.number),
                  customTextField('Choose shift weekend2 (0/1/2/3)', updateWeekend2, false,TextInputType.number),
                  customTextField('Choose shift weekend3 (0/1/2/3)', updateWeekend3, false,TextInputType.number),
                  customTextField('Choose shift weekend4 (0/1/2/3)', updateWeekend4, false,TextInputType.number),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () async{

                        int response= await ref.read(providerEmployeeServices).addPreference(week1,week2,week3,week4,
                            weekend1,weekend2,weekend3,weekend4);
                        if(response == 0) {
                          if(!mounted) return;
                          showMyDialog(context, "Registration error", response.toString());
                        } else {
                          if(!mounted) return;
                          await showMyDialog(context, "Registration Successful", 'Preference $response added');
                          if(mounted) {
                            setState(() {
                              pref= ref.read(providerEmployeeServices).getPreference();
                          });
                          }
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
      ),
    );
  }
}
