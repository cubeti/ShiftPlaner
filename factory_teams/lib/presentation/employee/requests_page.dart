import 'package:factory_teams/models/preference.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/request.dart';
import '../../models/user.dart';
import '../../providers/service_providers.dart';
import '../../services/widgets.dart';

class RequestPage extends ConsumerStatefulWidget {

  const RequestPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends ConsumerState<RequestPage> {
  late User user ;
  late bool isUser;
  late String reqDate1;
  late String reqDate2;
  List <Request> requests = [];

  void updatedate1(String s,WidgetRef ref) {
    reqDate1=s;
  }
  void updatedate2(String s,WidgetRef ref) {
    reqDate2=s;
  }

  @override
  void initState() {
    requests = ref.read(providerEmployeeServices).getRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        centerTitle: true,
        title: Text('Set request for ${ref.read(providerHiveService).getUser().name}'

        ),
      ),
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
                  customTextField('Choose starting day yyyy-MM-dd', updatedate1, false,TextInputType.datetime),
                  customTextField('Choose end day yyyy-MM-dd', updatedate2, false,TextInputType.datetime),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,borderRadius: BorderRadius.circular(15)
                ),
                child: ElevatedButton(
                  onPressed: () async {
                      int response= await ref.read(providerEmployeeServices).addRequest(reqDate1,reqDate2);
                      if(response > 0){
                        if(!mounted) return;
                        setState((){
                          requests = ref.read(providerEmployeeServices).getRequests();
                        });
                      }

                  },
                  child: const Text('Submit request',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              ),
              Expanded(child: CustomListView(requests))

            ],
          ),
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {

CustomListView( this.requests, {Key? key} ) : super(key: key);
final List<Request> requests;

final Map<String,Color> colors= {
  'new' : Colors.yellow,
  'ok' : Colors.green,
  'notok' : Colors.red, 
};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        itemCount: requests.length,
        itemBuilder: (context, index) {
          String s = requests[index].startDate;
          return Card(
              color: colors[requests[index].status],
              child: ListTile(

                  title: Text('${requests[index].uid}:${requests[index].startDate}'),
                  subtitle: Text(requests[index].endDate),
                  ),
              );
        });
  }
}
