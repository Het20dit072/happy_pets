import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:happy_pets/Login/Login.dart';

import 'package:happy_pets/OTP/phoneregister.dart';
import 'package:happy_pets/screens/location_screen.dart';
import 'package:location/location.dart';

import 'package:lottie/lottie.dart';

import 'package:pinput/pin_put/pin_put.dart';

class Otp extends StatefulWidget {
  final String phoneNumber;
  final String codeDigits;
  Otp({Key? key, required this.phoneNumber, required this.codeDigits})
      : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinCode = TextEditingController();
  final FocusNode _pinCodeFocus = FocusNode();
  String? varificationCode;
  final BoxDecoration pinCodeDecoration = BoxDecoration(
      color: Color.fromARGB(255, 114, 180, 255),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.black,
      ));
  bool codeNotSent = true;
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  @override
  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.codeDigits + widget.phoneNumber}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) {
            if (value.user != null) {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => LoginPage());
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.message.toString(),
            ),
          ),
        );
      },
      codeSent: (String vID, int? resendToken) {
        setState(() {
          varificationCode = vID;
          codeNotSent = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("OTP sent."),
            backgroundColor: Colors.orangeAccent,
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          varificationCode = verificationId;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthsize = MediaQuery.of(context).size.width;
    var heightsize = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 114, 180, 255),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'images/otp.png',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: PinPut(
                    
                    fieldsCount: 6,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    eachFieldWidth: 30,
                    eachFieldHeight: 55,
                    autofocus: true,
                    focusNode: _pinCodeFocus,
                    controller: _pinCode,
                    submittedFieldDecoration: pinCodeDecoration,
                    selectedFieldDecoration: pinCodeDecoration,
                    followingFieldDecoration: pinCodeDecoration,
                    pinAnimationType: PinAnimationType.rotation,
                    onSubmit: (pin) async {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: varificationCode!,
                                smsCode: pin))
                            .then(
                          (value) async {
                            if (value.user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Login Successfully."),
                                  backgroundColor: Color.fromARGB(255, 114, 180, 255),
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LocationScreen(),
                                ),
                              );
                            }
                          },
                        );
                      } catch (e) {
                        FocusScope.of(context).unfocus();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Invalid OTP"),
                          ),
                        );
                      }
                    },
                  )),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => LocationScreen(),
                          //     ));
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 114, 180, 255),),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              'Verify ${widget.phoneNumber}',
                              style: TextStyle(fontSize: 16),
                            )))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => PhoneAuthInput(),
                  ));
                },
                child: Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 114, 180, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 60,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Color.fromARGB(255, 114, 180, 255),),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}

class kdialougebox extends StatefulWidget {
  const kdialougebox({
    Key? key,
  }) : super(key: key);

  @override
  State<kdialougebox> createState() => _kdialougeboxState();
}

class _kdialougeboxState extends State<kdialougebox> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Center(child: Text("Verification Successfull")),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
