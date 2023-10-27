import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task3/Screen/My_home/bottom_navigation_bar/navigationBar.dart';
import 'package:task3/Screen/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task3/shared/cash.dart';

import '../../shared/componets/componets.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
 final _auth = FirebaseAuth.instance;
 class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passordController = TextEditingController();
  TextEditingController passordController1 = TextEditingController();
  bool password = true;
  bool confpassword = true;
  bool loading = true;
  var formKey = GlobalKey<FormState>();
 late String name;
  late String phone;
  late String emailaddres;
  late String passwordd;
  late String confpasswordd;

  @override
  Widget build(BuildContext context) {
    var heightS = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: heightS*0.05,
                        color: Color(0xE7E7600D),
                      ),
                    ),
                    SizedBox(
                      height: heightS*0.025,
                    ),
                    Lottie.asset(
                      'image/register.json',
                    ),
                    SizedBox(
                      height: heightS*0.025,
                    ),
                    TextFormField(
                      onChanged: (value){
                        name = value;
                      },
                      controller: nameController,
                      cursorColor: Color(0xE7E7600D),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Full Name*',
                        labelText: 'Full Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xE7E7600D),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightS*0.025,
                    ),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        hintText: 'Phone number*',
                        labelText: 'phone number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xE7E7600D),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightS*0.010,
                    ),
                    TextFormField(
                      onChanged: (value){
                        emailaddres = value;
                      },
                      cursorColor: Color(0xE7E7600D),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                          if(value?.isEmpty == true){
                           return 'this email is not valid';
                        };
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email Address*',
                        labelText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xE7E7600D),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightS*0.025,
                    ),
                    TextFormField(
                      onChanged: (value){
                        passwordd = value;
                      },
                      obscureText: password,
                      cursorColor: Color(0xE7E7600D),
                      controller: passordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              password = !password;
                            });
                          },
                          icon: Icon(
                              password ? Icons.visibility_off : Icons.visibility),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xE7E7600D),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightS*0.025,
                    ),
                    TextFormField(
                      onChanged: (value){
                        confpasswordd = value;
                      },
                      obscureText: confpassword,
                      cursorColor: Color(0xE7E7600D),
                      controller: passordController1,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'password must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confpassword = !confpassword;
                            });
                          },
                          icon: Icon(
                              confpassword ? Icons.visibility_off : Icons.visibility),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xE7E7600D),
                        ),
                      ),
                    ),
                    SizedBox(height: heightS*0.025),
                    loading
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xE7E7600D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            onPressed: () async {
                          try{
                            final newUser= await _auth.createUserWithEmailAndPassword(email: emailaddres, password: passwordd)
                                .then((value) => {
                                   id=value.user!.uid,
                                   cashhelper.savedata(key: "id", value: id),
                            }).catchError((error){
                                  print(error.toString());
                            });
                          }catch(e){
                            print(e);
                          }
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  loading = !loading;
                                  Future.delayed(
                                      Duration(milliseconds: 500), () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  });
                                });
                              }
                            },
                            child: Container(
                                height: 50,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'SignUp',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                )))
                        : Center(
                            child: const CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          ),
                    SizedBox(height: heightS*0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You have an account ?',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            });
                          },
                          child: Text(
                            'Login here',
                            style: TextStyle(
                              color: Color(0xE7E7600D),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}