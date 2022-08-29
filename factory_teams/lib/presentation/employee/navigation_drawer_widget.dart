import 'package:factory_teams/providers/service_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../login_page.dart';


class NavigationDrawerWidget extends ConsumerWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

   NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name = ref.read(providerHiveService).getUser().name;
    final email = ref.read(providerHiveService).getUser().email;
    final urlImage =
        "https://i.picsum.photos/id/62/200/200.jpg?hmac=IdjAu94sGce82DBYTMbOYzXr7kup1tYqdr0bHkRDWUs";
    return Drawer(
      child: Material(
        color: Colors.deepPurple[400],
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => {}
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'Schedule',
                    icon: Icons.calendar_month,
                    onClicked: () => selectedItem(context, 0,ref),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Set Preference',
                    icon: Icons.star,
                    onClicked: () => selectedItem(context, 1,ref),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Requests',
                    icon: Icons.message_rounded,
                    onClicked: () => selectedItem(context, 2,ref),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Log out',
                    icon: Icons.power_settings_new,
                    onClicked: () => selectedItem(context, 3,ref),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );



  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index,WidgetRef ref) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => PeoplePage(),
        // ));
        break;
      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => FavouritesPage(),
        // ));
        break;
      case 2:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => FavouritesPage(),
      // ));
        break;
      case 3:{ //log out
        ref.read(providerHiveService).deleteUser();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage() ));
        break;
      }

    }
  }
}
