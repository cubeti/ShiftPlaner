import 'package:factory_teams/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

import '../../providers/auth_providers.dart';


class EmployeePage extends ConsumerStatefulWidget {
  const EmployeePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _EmployeePageState();
}

class _EmployeePageState extends ConsumerState<EmployeePage> {
  PageController page = PageController();
  @override
  void dispose() {
    page.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        centerTitle: true,
        title: Text('Hello ${ref.read(providerLogInName)}'

        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            onDisplayModeChanged: (mode) {
              print(mode);
            },
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              backgroundColor: Colors.deepPurple[100]
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Calendar',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.calendar_today_rounded),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Requests',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.swap_horizontal_circle),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Settings',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.settings),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Exit',
                onTap: ()  { ref.read(providerLogInStatus.notifier).state = '';},
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Calendar',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Requests',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
