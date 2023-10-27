import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/Screen/login/login_screen.dart';
import 'package:task3/shared/componets/componets.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  _SettingScreenState createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var heightS = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            design(),
            SizedBox(height:heightS*0.04),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.dark_mode),
                      title: Text('Dark Mode'),
                      trailing: Switch(
                        value: themeProvider.isDarkModeEnabled,
                        onChanged: (value) {
                          setState(() {
                            themeProvider.isDarkModeEnabled = value;
                          });
                        },
                      ),
                    ),
                    Divider(
                      color: Color(0xE7E7600D),
                    ),
                    ListTile(
                        leading:
                        Icon(Icons.login_outlined, color: Color(0xE7E7600D)),
                        title: Text("Logout"),
                        onTap: () {
                          setState(
                                () {
                              Future.delayed(Duration(milliseconds: 500), () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              });
                            },
                          );
                        }),
                    Divider(
                      color: Color(0xE7E7600D),
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text('Language'),
                      trailing: IconButton(onPressed: () {  }, icon:Icon(
                        Icons.spellcheck
                    )),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
Widget design() {
  return Container(
    height: 175,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(100),
        bottomLeft: Radius.circular(100),
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFE7E7600D),
          Color(0xFFE7D9D2E7),
          Color(0xFFE7E7600D),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(0, 3),
          blurRadius: 6,
        ),
      ],
    ),
    child: Center(
      child: Text(
        'GENERAL',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}