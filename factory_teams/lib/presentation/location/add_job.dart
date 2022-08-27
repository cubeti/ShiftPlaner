import 'package:factory_teams/providers/isar_providers.dart';
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


  void updateNrShiftsWeekday(String s,WidgetRef ref){
    ref.read(providerJobsNrShiftsWeekday.notifier).state = int.parse(s);
  }
  void updateNrShiftsWeekend(String s,WidgetRef ref){
    ref.read(providerJobsNrShiftsWeekend.notifier).state = int.parse(s);
  }
  void updateShiftsWeekdayLength(String s,WidgetRef ref){
    ref.read(providerJobsShiftsWeekdayLength.notifier).state =int.parse(s);
  }
  void updateShiftsWeekendLength(String s,WidgetRef ref){
    ref.read(providerJobsShiftsWeekendLength.notifier).state =int.parse(s);
  }
  void updateMinPeopleMorning(String s,WidgetRef ref){
    ref.read(providerJobsMinPeopleMorning.notifier).state=int.parse(s);
  }
  void updateMinPeopleEvening(String s,WidgetRef ref){
    ref.read(providerJobsMinPeopleEvening.notifier).state=int.parse(s);
  }
  void updateMinPeopleNight(String s,WidgetRef ref){
    ref.read(providerJobsMinPeopleNight.notifier).state=int.parse(s);
  }
  void updateTitle(String s,WidgetRef ref){
    ref.read(providerJobsTitle.notifier).state = s;
  }
  void updateWeekdays(String s,WidgetRef ref){
    ref.read(providerJobsNrWeekdays.notifier).state=int.parse(s);
  }
  void updateWeekends(String s,WidgetRef ref){
    ref.read(providerJobsNrWeekends.notifier).state=int.parse(s);
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
              customTextField('How many workdays Sa-Su/week', updateWeekends, false, TextInputType.number),


              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(
                  onPressed: () async {
                    final value = await ref.read(providerSqlService).insertJob();
                    if(value == -1) {
                      // ignore: use_build_context_synchronously
                      showMyDialog(context,"Error","SQL insert error");
                    }
                    if(value == 0) {
                      // ignore: use_build_context_synchronously
                      showMyDialog(context,"Error","Position already exists");
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
