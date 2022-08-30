import 'package:factory_teams/models/location.dart';
import 'package:factory_teams/presentation/admin/register_page.dart';
import 'package:factory_teams/presentation/login_page.dart';
import 'package:factory_teams/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/service_providers.dart';

class AdminPage extends ConsumerStatefulWidget {

  const AdminPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AdminPageState();
}

class _AdminPageState extends ConsumerState<AdminPage> {
  List<Location> locations = [];
  void init()async{
    print('Admin page init');
    await ref.read(providerAdminServices).setLocationsFromDb();
    setState(() {
      print('Admin page init done');
    });
  }


  @override
  void initState() {
    init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('Admin page build');
    locations = ref.read(providerAdminServices).getLocations();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){

            ref.read(providerHiveService).deleteUser();
            Navigator.push(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage() ));
          },
              icon: Icon(Icons.add)
          )
        ],
        centerTitle: true,
        title: Text(
          'ADMIN'
        ),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (BuildContext context,int index){
                return Container(
                  height: 150,
                  child: Center(
                    child: Card(
                      color: Colors.deepPurple[100],
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Center(
                        child: ListTile(
                          trailing: IconButton(
                            onPressed: ()async{
                              await ref.read(providerAdminServices).deleteLocation(locations[index].id);
                              setState(() {
                              });
                            },
                            icon: Icon(Icons.delete,color: Colors.red,),
                          ),
                          title: Text(
                            locations[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                          ),
                          subtitle: Text(
                              'Contact at ${locations[index].email}',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)) ,
                        ),
                      ),
                    ),
                  ),
                );
          }
      ),
    );
  }
}
