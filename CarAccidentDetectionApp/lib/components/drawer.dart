import 'package:flutter/material.dart';
import 'package:maps/components/order_tracking_page.dart';
import 'package:maps/pages/maps.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Jayaraj'),
            accountEmail: Text('jayaraj.c21@iiits.in'),
            currentAccountPicture: CircleAvatar(
              //radius: 200,
              child: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                      'https://images8.alphacoders.com/625/625632.jpg',
                    ),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.navigation),
            title: Text('Maps'),
            onTap: () {
              Navigator.pushReplacementNamed(context, OrderTrackingPage.route);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.details),
            title: Text(' Car Details'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
