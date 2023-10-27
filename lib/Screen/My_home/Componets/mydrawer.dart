import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Text('offers',
                  style: TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      fontFamily:'Arial'
                  ),),
              ),
              decoration: BoxDecoration(
                color: Color(0xE7E7600D),
              ),
            ),
            ListTile(
              title: Text('Fast Food'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Drinks'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Combos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}