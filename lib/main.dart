import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:happy_pets/screens/HomeScreen/HomePage.dart';
import 'package:happy_pets/screens/Login/Login.dart';
import 'package:happy_pets/screens/splash_screen/splash_screen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Pets',
      home:  HomePage(),
    );
  }
}


