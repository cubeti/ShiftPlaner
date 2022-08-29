import 'package:factory_teams/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

import '../../providers/auth_providers.dart';
import '../../providers/service_providers.dart';
import '../login_page.dart';
import 'button_widget.dart';
import 'navigation_drawer_widget.dart';


class EmployeePage extends ConsumerStatefulWidget {

  const EmployeePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _EmployeePageState();
}

class _EmployeePageState extends ConsumerState<EmployeePage> {

  init() async {
    await ref.read(providerEmployeeServices).setData();
    print("Got employee data");
    if(!mounted) return;
    setState(() {

    });
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
      drawer: NavigationDrawerWidget(),
      body: Builder(
              builder: (context) => Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 32),
                    child: ButtonWidget(
                          icon: Icons.open_in_new,
                           text: 'Open Drawer',
                          onClicked: () {
                          Scaffold.of(context).openDrawer();},
                        ),
                  ),
              ),
        );
    }
}
