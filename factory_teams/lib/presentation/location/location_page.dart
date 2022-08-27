import 'package:factory_teams/models/employee.dart';
import 'package:factory_teams/models/job.dart';
import 'package:factory_teams/presentation/change_password_page.dart';
import 'package:factory_teams/presentation/location/add_employee.dart';
import 'package:factory_teams/presentation/location/add_job.dart';
import 'package:factory_teams/providers/isar_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/auth_providers.dart';

class LocationPage extends ConsumerStatefulWidget {
  const LocationPage({
    Key? key,
  }) : super(key: key);
  @override
  ConsumerState createState() => _LocationPageState();
}

class _LocationPageState extends ConsumerState<LocationPage> {

  List<Job> _jobs= [];
  List<Employee> _emp = [];
  void init()async{
    if(ref.read(providerHiveService).getUser().status == 'new')
      {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PasswordChangePage()),
        );
      }
    _jobs = await ref.read(providerIsarService).getJobs(ref.read(providerHiveService).getUser().id);
    _emp = await ref.read(providerIsarService).getEmployees();
    print(_emp);
    setState(() {

    });
    //_emp =  await ref.read(providerIsarService);
  }
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){ ref.read(providerLogInStatus.notifier).state = '';
          ref.read(providerHiveService).deleteUser();
          },
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.deepPurple[200],
        centerTitle: true,
        title: Text(
            ref.read(providerLogInName)
        ),
      ),
      body: Column(
        children:  <Widget>[
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)
                ),
                width: w/4,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterJob()));},
                  child: Text(
                    "Add Jobs",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)
                ),
                width: w/4,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterEmployee()));},
                  child: Text(
                    "Add Employee",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)
                ),
                width: w/3,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterEmployee()));},
                  child: Text(
                    "See Schedules",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                _jobsTitle(),
                _empList()
                //_EmployeeListView(),
                //_requestsListView(),
              ],
            ),
          )
        ],
      )

    );
  }
  Widget _empList(){
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _emp.length,
        itemExtent: 200.0,
        itemBuilder: (context, index) {
          var item = _emp[index];
          return Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          item.url,
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black26,
                          BlendMode.darken,
                        ),
                      ),
                      color: Colors.grey,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text(item.uid.toString()),
                  subtitle: Text(
                    item.phone.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  SizedBox _jobsTitle(){
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _jobs.length,
        itemExtent: 100.0,
        itemBuilder: (context, index) {
          var item = _jobs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.deepPurple[300],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 14.0,
                        child: Text('3',style: TextStyle(color: Colors.red,fontSize: 24),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      item.Title,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
