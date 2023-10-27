import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/Screen/Api_connection/apiConnection.dart';
import 'package:task3/Screen/My_home/View_screen/myHome.dart';
import 'package:task3/Screen/Profile/Profile.dart';
import 'package:task3/Screen/favorite/favorite_screen.dart';
import 'package:task3/Screen/setting/setting_screen.dart';
import 'package:task3/shared/componets/componets.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  late User SignInUser;
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        SignInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  final screens = <Widget>[
    HomeNew(),
    Profile6(),
    FavoriteScreen(favoriteItems: []),
    SettingScreen(),
    FoodsScreen()
  ];
  List<String> titles = ['Fast Food', 'My profile', 'Favorite', 'Setting','Show Api'];
  bool isHome = true;
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xE7E7600D),
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket),
          ),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xE7E7600D),
        unselectedItemColor:themeProvider.isDarkModeEnabled ? Colors.white : Colors.black,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
              size: 30,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            label: "Favorite",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            label: "Setting",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.api,
              size: 30,
            ),
            label: "Show Api",
          ),
        ],
      ),
    );
  }
}