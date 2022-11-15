import 'package:flutter/material.dart';
import 'package:flutter_admin/screens/Admin/admin_screen.dart';
import 'package:flutter_admin/screens/Login/login_screen.dart';
import 'package:flutter_admin/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScreen> {
  String key = '';

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var isLogin = pref.getBool("is_login");
    if (isLogin != null && isLogin == true) {
      setState(() {
        // ignore: unused_local_variable
        String? key = pref.getString('key');
      });
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context, rootNavigator: true).pop();
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  void loginPageRoute() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  void adminPageRoute() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext contenxt) => const AdminScreen(),
        ),
        result: (route) => false);
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("is_login");
      preferences.remove('key');
    });
    loginPageRoute();
    showSuccessMessage("Logout");
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(
      content: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          // Importan: Remove any padding from the ListView
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              accountName: Text(
                "Admin",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "admin@example.com",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.admin_panel_settings),
              title: const Text('Admin'),
              onTap: adminPageRoute,
            ),
            const AboutListTile(
              icon: Icon(
                Icons.info,
              ),
              applicationIcon: Icon(
                Icons.local_play,
              ),
              applicationName: 'My Cool App',
              applicationVersion: '1.0.25',
              applicationLegalese: '© 2019 Company',
              aboutBoxChildren: [
                ///Content goes here...
              ],
              child: Text('About app'),
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  logOut();
                }),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
