import 'package:flutter/material.dart';
// import 'package:email_password_login/widgets/widget_illustration.dart';

class GeneralLogo extends StatelessWidget {
  final Widget? child;
  GeneralLogo ({this.child});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
        SizedBox(
          height: 50,
        ),
        Image.asset(
          "assets/splash/logo.png",
          width: 115,
        ),
      child ?? SizedBox()
      ],
      ),
    );
}}