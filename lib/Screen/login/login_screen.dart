import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task3/Screen/My_home/bottom_navigation_bar/navigationBar.dart';
import 'package:task3/Screen/register/register_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passordController = TextEditingController();
  bool password = true;
  bool loading = true;
  var formKey = GlobalKey<FormState>();
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
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Color(0xE7E7600D),
                      ),
                    ),
                    SizedBox(
                      height: heightS*0.03,
                    ),
                    Lottie.asset('image/sign.json'),
                    SizedBox(
                      height: heightS*0.025,
                    ),
                    TextFormField(
                      cursorColor: Color(0xE7E7600D),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        labelText: 'Email Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xE7E7600D),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'email addres must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: heightS*0.025,
                    ),
                    TextFormField(
                      obscureText: password,
                      cursorColor: Color(0xE7E7600D),
                      controller: passordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'password  must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              password = !password;
                            });
                          },
                          icon: Icon(password
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xE7E7600D),
                        ),
                      ),
                    ),
                    SizedBox(height: heightS*0.001),
                    TextButton(onPressed: (){}, child: Text(
                      'Forget password ?',
                      style: TextStyle(
                        color: Color(0xE7E7600D),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                    SizedBox(height: heightS*0.015),
                    loading
                        ?
                    ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xE7E7600D),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  loading = !loading;
                                  Future.delayed(Duration(milliseconds: 500),
                                      () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()));
                                  });
                                });
                              }
                            },
                            child: Container(
                                height: 55,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Login',
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
                    SizedBox(height: heightS*0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have account ?',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            });
                          },
                          child: Text(
                            'Sign Up',
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
