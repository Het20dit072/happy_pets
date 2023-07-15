import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_pets/Login/Login.dart';
import 'package:happy_pets/OTP/phoneregister.dart';
import 'package:lottie/lottie.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 7),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginPage())));
  }

  Widget build(BuildContext context) {
    var widthsize = MediaQuery.of(context).size.width;
    var heightsize = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 114, 180, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: heightsize / 50,
              ),
              SvgPicture.asset(
                "images/logo.svg",
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widthsize / 10, vertical: heightsize / 20),
        child: Lottie.asset(
          "images/splash_json.json",
          height: heightsize / 8,
        ),
      ),
    );
  }
}
