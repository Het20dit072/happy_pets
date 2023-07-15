import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:happy_pets/Google-SignIn/googleAuth.dart';
import 'package:happy_pets/OTP/phoneregister.dart';
import 'package:happy_pets/SignUp/signup.dart';
import 'package:happy_pets/screens/location_screen.dart';

import 'package:provider/provider.dart';

import '../Forgot_password/Forgot_password.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String email = "";
String? LogInid;
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  bool PassShow = true;
  bool confirmPassShow = true;
  bool clickSignUpButton = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Material(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return LocationScreen();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Something went wrong!"),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                        child: Container(
                          child: Image.asset(
                            "images/login.png",
                            height: 280,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Container(
                          child: TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Email can't be empty";
                              }
                              null;
                            },
                            onChanged: (value) {
                              email = value;
                            },
                            key: _formkey,
                            controller: _emailController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 2.5,
                                color: Color.fromARGB(255, 114, 180, 255),
                              )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(255, 114, 180, 255),
                              )),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color.fromARGB(255, 114, 180, 255),
                              )),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Password can't be empty";
                            }
                            null;
                          },
                          obscureText: PassShow,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: Icon(
                                PassShow
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 2.5,
                              color: Color.fromARGB(255, 114, 180, 255),
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(255, 114, 180, 255),
                            )),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 114, 180, 255),
                            )),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forgot_password()));
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Color.fromARGB(255, 114, 180, 255),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          height: 60,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 114, 180, 255),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(05.0),
                                )),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              print(_emailController.text);
                              print(_passwordController.text);

                              loginUserWithEmail(context);
                            },
                          )),
                      Row(
                        children: <Widget>[
                          Text('Does not have account?'),
                          TextButton(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 114, 180, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                              //signup screen
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                            child: Divider(
                          endIndent: 5.0,
                          indent: 10,
                        )),
                        Text("OR"),
                        Expanded(
                            child: Divider(
                          indent: 5,
                          endIndent: 10,
                        )),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 60,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: ElevatedButton.icon(
                            icon: Image.asset(
                              "images/google.png",
                              height: 25,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 114, 180, 255),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(05.0),
                                )),
                            label: Text(
                              'SignIn With Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.googleLogin();
                              await Future.delayed(Duration(seconds: 3));
                              Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PhoneAuthInput()));
                              
                            },
                          )),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

Future loginUserWithEmail(BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    auth
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((signedInUser) async {
      print("success");
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PhoneAuthInput()));
    });
  } catch (e) {}
}
