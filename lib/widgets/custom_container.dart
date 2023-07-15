import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
   double height;
    double  width;
    double  circularradii;
  CustomContainer({required this.child, required this.height,required this.width,required this.circularradii});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 2.0,
        //     color: Colors.grey.shade300,
        //     spreadRadius: 2.0,
        //   ),
        // ],
        borderRadius: BorderRadius.circular(circularradii),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
