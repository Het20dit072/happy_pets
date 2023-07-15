import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:happy_pets/Login/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}
final TextEditingController _FullNameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String fullName='';


class _SignUpState extends State<SignUp> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
              child: Container(
                
                child: Image.asset("images/signup.png", height: 280,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                
                child: TextFormField(
                  controller: _FullNameController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 114, 180, 255),)

                    ),
                    labelText: 'Full Name',
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                
                child: TextFormField(
                  controller: _EmailController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 114, 180, 255),)

                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
            ),
            Container(
              padding:  EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                obscureText: true,
               controller: _passwordController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                   borderSide: BorderSide(
                    color: Color.fromARGB(255, 114, 180, 255),)
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding:  EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                obscureText: true,
               controller: _confirmPasswordController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                   borderSide: BorderSide(
                    color: Color.fromARGB(255, 114, 180, 255),)
                  ),
                  labelText: 'Conform Password',
                ),
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

                  ) 
                  ),
                  child:  Text('Sign Up', style: TextStyle(

                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),
                  onPressed: () {
                    registerUser(context);
                  }
                    
                    
                     
                )
            ),
            
          ],
        )));
  }
}

Future registerUser(BuildContext context) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  auth.createUserWithEmailAndPassword(email: _EmailController.text, password: _passwordController.text).then((signedInUser) async {
    User? user = await FirebaseAuth.instance.currentUser;
    try {
      user!.updateProfile(displayName: fullName);
      await FirebaseFirestore.instance.collection('Users').doc(signedInUser.user?.uid).set({
      'Full Name' : _FullNameController.text,
      'Email' : _EmailController.text
    }).then((signedInUser){
      print("success");
       Navigator.pushReplacement(
                                   context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
    });
    } catch (e) {
      print(e);
      print("error");
    }
  });
}