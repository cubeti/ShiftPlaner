

import 'package:factory_teams/providers/auth_providers.dart';
import 'package:factory_teams/providers/isar_providers.dart';
import 'package:factory_teams/providers/regex_providers.dart';
import 'package:factory_teams/providers/sql_providers.dart';
import 'package:factory_teams/services/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/registration_providers.dart';

class RegisterEmployee extends ConsumerStatefulWidget {
  const RegisterEmployee({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _RegisterEmployeeState();
}

class _RegisterEmployeeState extends ConsumerState<RegisterEmployee> {

  String dropdownValue = 'One';
  List<String> jobtitles=[];
  void init()async{
    jobtitles=await ref.read(providerIsarService).getAllJobsTitle();
    dropdownValue = jobtitles.first;
    ref.read(providerRegistrationRole.notifier).state = dropdownValue;
    setState(() {

    });
  }
  @override
  void initState() {
    init();
    super.initState();
  }

  void updateEmail(String s,WidgetRef ref){
    ref.read(providerRegistrationEmail.notifier).state = s;
  }
  void updateWage(String s,WidgetRef ref){
    ref.read(providerRegistrationWage.notifier).state =double.parse(s);
  }
  void updateVacation(String s,WidgetRef ref){
    ref.read(providerRegistrationVacationDays.notifier).state =int.parse(s);
  }
  void updatePhone(String s,WidgetRef ref){
    ref.read(providerRegistrationPhone.notifier).state =int.parse(s);
  }
  void updateNorm(String s,WidgetRef ref){
    ref.read(providerRegistrationNorm.notifier).state=int.parse(s);
  }
  void updatePsw1(String s,WidgetRef ref){
    ref.read(providerRegistrationPassword.notifier).state = s;
  }
  void updateName(String s,WidgetRef ref){
    ref.read(providerRegistrationName.notifier).state = s;
  }
  void updateUrl(String s,WidgetRef ref){
    ref.read(providerRegistrationUrl.notifier).state = s;
  }
  void updateJob(String s,WidgetRef ref){
    ref.read(providerRegistrationJob.notifier).state = s;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text('Add Employee'),
        centerTitle: true,
      ),
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextField('Email',updateEmail,false,TextInputType.text),
              customTextField('Name',updateName,false,TextInputType.text),
              customTextField('Phone',updatePhone,false,TextInputType.phone),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Select job title  "),dropButton()
              ],),
              customTextField('Photo URL',updateUrl,false,TextInputType.url),
              customTextField('Password',updatePsw1,true,TextInputType.text),
              customTextField('Vacation Days',updateVacation,false,TextInputType.number),
              customTextField('Pay/month',updateWage,false,TextInputType.number),
              customTextField('Norm hours',updateNorm,false,TextInputType.number),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,borderRadius: BorderRadius.circular(15)
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    ref.read(providerRegistrationRole.notifier).state='employee';
                    if(ref.read(providerRegistrationEmail).isEmpty || ref.read(providerRegistrationName).isEmpty || ref.read(providerRegistrationPassword).isEmpty ||
                        ref.read(providerRegistrationWage).toString().isEmpty || ref.read(providerRegistrationVacationDays).toString().isEmpty ||
                        ref.read(providerRegistrationNorm).toString().isEmpty){
                      await showMyDialog(context, 'Empty Fields', 'Check and try again');
                      print('This is not inserting');
                      return;
                    }
                    ref.watch(providerInsertEmployee).when(data: (data) {print("ok inserted user");},
                        error: (er,st) async { await showMyDialog(context, 'Error', er.toString());},
                        loading: (){});
                    Navigator.pop(context);

                  },
                  child: const Text('Submit',style: TextStyle(color: Colors.white,fontSize: 25),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget dropButton(){
    return DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.search),
        elevation: 15,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 3,
          color: Colors.deepPurpleAccent,
        ),
        items: jobtitles .map<DropdownMenuItem<String>>((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        }).toList(),
        onChanged: (String? newVal){
          setState(() {
            ref.read(providerRegistrationRole.notifier).state = newVal ??dropdownValue;
            dropdownValue=newVal ?? dropdownValue;
          });
        }
    );
  }
}
