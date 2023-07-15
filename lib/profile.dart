import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:happy_pets/Login/Login.dart';
import 'package:happy_pets/data.dart';

class ProfileApp extends StatefulWidget {
  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

final googleSignIn = GoogleSignIn();
GoogleSignInAccount? _user;
GoogleSignInAccount get user => _user!;
Future googleLogin() async {
  try {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print(e.toString());
  }
}

Future Logout() async {
  await googleSignIn.disconnect();
  FirebaseAuth.instance.signOut();
}

class _ProfileAppState extends State<ProfileApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 160, 206, 236),
                    Color.fromARGB(255, 114, 180, 255)
                  ])),
              child: Container(
                width: double.infinity,
                height: 280.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'images/userm2.png',
                        ),
                        radius: 80.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Het Prajapati",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      // Card(
                      //   margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      //   clipBehavior: Clip.antiAlias,
                      //   color: Colors.white,
                      //   elevation: 5.0,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                      //     child: Row(
                      //       children: [
                      //         Expanded(
                      //           child: Column(

                      //             children: [
                      //               Text(
                      //                 "Posts",
                      //                 style: TextStyle(
                      //                   color: Colors.redAccent,
                      //                   fontSize: 22.0,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 5.0,
                      //               ),
                      //               Text(
                      //                 "1200",
                      //                 style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   color: Colors.pinkAccent,
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Column(

                      //             children: [
                      //               Text(
                      //                 "Followers",
                      //                 style: TextStyle(
                      //                   color: Colors.redAccent,
                      //                   fontSize: 22.0,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 5.0,
                      //               ),
                      //               Text(
                      //                 "21.2K",
                      //                 style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   color: Colors.pinkAccent,
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Column(

                      //             children: [
                      //               Text(
                      //                 "Follow",
                      //                 style: TextStyle(
                      //                   color: Colors.redAccent,
                      //                   fontSize: 22.0,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 5.0,
                      //               ),
                      //               Text(
                      //                 "1200",
                      //                 style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   color: Colors.pinkAccent,
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Owner Details :",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.brown,
                    ),
                    title: Text("203,shreedeep Hostel"),
                    subtitle: Text("near charusat university,changa"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_city_outlined,
                      color: Colors.brown,
                    ),
                    title: Text("Country : India"),
                    subtitle: Text("State : Gujarat"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.phone_rounded,
                        color: Colors.brown,
                      ),
                      title: Text("+91 8238498758"))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 300.00,
            child: MaterialButton(
                color: Colors.white,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 160, 206, 236),
                          Color.fromARGB(255, 114, 180, 255)
                        ]),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
