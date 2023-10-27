import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/Screen/setting/language/language_app.dart';
import 'package:task3/Screen/splash/splash_screen.dart';
import 'package:task3/shared/componets/componets.dart';
import 'package:task3/shared/cash.dart';
import 'Screen/Profile/Profile.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cashhelper.init();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            // supportedLocales: [
            //   Locale('en', 'US'), // الإنجليزية
            //   Locale('ar', 'SA'), // العربية
            // ],
            // locale: _currentLocale,
            // localizationsDelegates: [
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            // ],
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        final sharedPreferences = snapshot.data!;
        final themeProvider = ThemeProvider(sharedPreferences);
        return ChangeNotifierProvider.value(
          value: themeProvider,
          child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
              theme: themeProvider.isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
              darkTheme: ThemeData.dark().copyWith(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Color(0xE7E7600D), //
              unselectedItemColor: Colors.white,
              ),
                  ),
                home: SplashScreen(),

              );
            },
          ),
        );
      },
    );
  }
}