import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Color(0xffDFF8EB),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
              child: Container(
                
                child: Image.asset("assets/SignUpPage/signup.png", height: 280,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                
                child: TextField(
                  
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(193, 33, 78, 52))

                    ),
                    labelText: 'Full Name',
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                
                child: TextField(
                  
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(193, 33, 78, 52))

                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
            ),
            Container(
              padding:  EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
               
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                   borderSide: BorderSide(
                    color: Color.fromARGB(193, 33, 78, 52))
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding:  EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
               
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                   borderSide: BorderSide(
                    color: Color.fromARGB(193, 33, 78, 52))
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
                    primary: Color.fromARGB(193, 33, 78, 52),
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
                    
                  },
                )
            ),
            
          ],
        )));
  }
}