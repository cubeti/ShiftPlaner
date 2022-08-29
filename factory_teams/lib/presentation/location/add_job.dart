import 'package:factory_teams/providers/isar_providers.dart';
import 'package:factory_teams/providers/service_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:factory_teams/services/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/registration_providers.dart';

class RegisterJob extends ConsumerStatefulWidget {
  const RegisterJob({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _RegisterJobState();
}

class _RegisterJobState extends ConsumerState<RegisterJob> {
   int nrShiftsWeekday = 0;
   int nrShiftsWeekend = 0;
   int shiftsWeekdayLength = 0;
   int shiftsWeekendLength = 0;
   int minPeopleEvening = 0;
  int minPeopleMorning = 0;
  int minPeopleNight = 0;
  String title = 'testjob';
  int nrWeekdays = 0;
  int nrWeekendDays = 0;
  int start1 = 0;
  int start2 = 0;
  int start3 = 0;
  void updateNrShiftsWeekday(String s,WidgetRef ref){
    nrShiftsWeekday = int.parse(s);
  }
  void updateNrShiftsWeekend(String s,WidgetRef ref){
    nrShiftsWeekend = int.parse(s);
  }
  void updateShiftsWeekdayLength(String s,WidgetRef ref){
    shiftsWeekdayLength = int.parse(s);
  }
  void updateShiftsWeekendLength(String s,WidgetRef ref){
    shiftsWeekendLength = int.parse(s);
  }
  void updateMinPeopleMorning(String s,WidgetRef ref){
    minPeopleMorning = int.parse(s);
  }
  void updateMinPeopleEvening(String s,WidgetRef ref){
    minPeopleEvening=int.parse(s);
  }
  void updateMinPeopleNight(String s,WidgetRef ref){
    minPeopleNight = int.parse(s);
  }
  void updateTitle(String s,WidgetRef ref){
    title = s;
  }
  void updateWeekdays(String s,WidgetRef ref){
    nrWeekdays = int.parse(s);
  }
  void updateWeekends(String s,WidgetRef ref){
    nrWeekendDays = int.parse(s);
  }
   void updateStart1(String s,WidgetRef ref){
     start1 = int.parse(s);
   }
   void updateStart2(String s,WidgetRef ref){
     start2 = int.parse(s);
   }
   void updateStart3(String s,WidgetRef ref){
     start3 = int.parse(s);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text('Add Job'),
        centerTitle: true,
      ),
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextField('Title', updateTitle, false, TextInputType.text),
              customTextField('Shifts per weekday day', updateNrShiftsWeekday, false, TextInputType.number),
              customTextField('Shifts per weekend day', updateNrShiftsWeekend, false, TextInputType.number),
              customTextField('Length of weekday shifts (hours)', updateShiftsWeekdayLength, false, TextInputType.number),
              customTextField('Length of weekend shifts (hours)', updateShiftsWeekendLength, false, TextInputType.number),
              customTextField('Minimum people on a morning shift', updateMinPeopleMorning, false, TextInputType.number),
              customTextField('Minimum people on a evening shift', updateMinPeopleEvening, false, TextInputType.number),
              customTextField('Minimum people on a night shift', updateMinPeopleNight, false, TextInputType.number),
              customTextField('How many workdays M-F/week', updateWeekdays, false, TextInputType.number),
              customTextField('How many workdays Sa-Su/month', updateWeekends, false, TextInputType.number),
              customTextField('Start hour morning shift', updateStart1, false, TextInputType.number),
              customTextField('Start hour evening shift', updateStart2, false, TextInputType.number),
              customTextField('Start hour night shift', updateStart3, false, TextInputType.number),


              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(
                  onPressed: () async {
                    final value = await ref.read(providerLocationServices).
                    addJob(
                        nrShiftsWeekday,
                        nrShiftsWeekend,
                        shiftsWeekdayLength,
                        shiftsWeekendLength,
                        minPeopleEvening,
                        minPeopleMorning,
                        minPeopleNight,
                        title,
                        nrWeekdays,
                        nrWeekendDays,
                        start1,
                        start2,
                        start3,
                    );
                    if(value == -1) {
                      // ignore: use_build_context_synchronously
                      showMyDialog(context,"Error","SQL insert error");
                    }
                    if(value == 0) {
                      // ignore: use_build_context_synchronously
                      showMyDialog(context,"Error","Position already exists");
                    }
                    else
                      {
                        if(!mounted) return;
                        showMyDialog(context,"Success","Job $value added");
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
    );
  }

}
