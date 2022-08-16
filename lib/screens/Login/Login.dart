import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:happy_pets/screens/OTP/phoneregister.dart';
import 'package:happy_pets/screens/SignUp/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffDFF8EB),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                  child: Container(
                    child: Image.asset(
                      "assets/loginPage/login.png",
                      height: 280,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Container(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                        width: 2.5,
                        color: Color.fromARGB(193, 33, 78, 52))),
                        enabledBorder: OutlineInputBorder(
                          
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(193, 33, 78, 52))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(193, 33, 78, 52))),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                        width: 2.5,
                        color: Color.fromARGB(193, 33, 78, 52))),
                      enabledBorder: OutlineInputBorder(

                          borderSide: BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(193, 33, 78, 52))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(193, 33, 78, 52))),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Color.fromARGB(193, 33, 78, 52),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(193, 33, 78, 52),
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
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(193, 33, 78, 52),
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
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
                Padding( 
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/5),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(193, 33, 78, 52),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image(
                                image: AssetImage(
                                    "assets/loginPage/facebook.png"))),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(193, 33, 78, 52),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image(
                                image:
                                    AssetImage("assets/loginPage/google.png"))),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(193, 33, 78, 52),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            icon: Image(
                                image:
                                    AssetImage("assets/loginPage/phone.png"))),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
