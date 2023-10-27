import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
String? id;
//Textformfield for all app////
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  required String Function(String?) validate,
  required String label,
  required String hint,
  required IconData prefix,

  Color cursorColor = const Color(0xE7E7600D),
}) {
  return TextFormField(
    cursorColor: Color(0xE7E7600D),
    controller: controller,
    keyboardType: type,
    decoration: InputDecoration(
      hintText: hint,
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      prefixIcon: Icon(prefix),
    ),
    validator: validate,
  );
}
/////////Change the themes of the application////
class ThemeProvider with ChangeNotifier {
  final SharedPreferences _sharedPreferences;
  final String _darkModeKey = 'isDarkModeEnabled';
  ThemeProvider(this._sharedPreferences);
  bool get isDarkModeEnabled => _sharedPreferences.getBool(_darkModeKey) ?? false;
  set isDarkModeEnabled(bool value) {
    _sharedPreferences.setBool(_darkModeKey, value);
    notifyListeners();
  }

}
