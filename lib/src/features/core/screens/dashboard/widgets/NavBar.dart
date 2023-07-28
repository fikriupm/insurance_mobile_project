import 'package:flutter/material.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/widgets/about.dart';
import 'package:insurance_boost/src/features/core/screens/pdf/pdf_screen.dart';
import 'package:share_plus/share_plus.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Fikri'),
            accountEmail: Text('fikri@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/dashboard/dash-person.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/menu-bg.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Consultant'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.file_copy),
            title: Text('Policies'),
            onTap: () {
              // Navigate to the About Us screen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PdfScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () async {
              final url =
                  'https://play.google.com/store/apps/details?id=com.app.insurance_boost';
              await Share.share('Check out this app:\n$url');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('About Us'),
            onTap: () {
              // Navigate to the About Us screen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
