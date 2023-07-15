import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:happy_pets/Google-SignIn/googleAuth.dart';
import 'package:happy_pets/splash_screen/splash_screen.dart';

import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp( 
    MyApp(),
  );
}


// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: GetMaterialApp(
            // home: LoginPage(),
          
          title: "HAPPY PETS",
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
         home: MySplashScreen(),
          
        ),
      );
}