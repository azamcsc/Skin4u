import 'package:customers_app/screens/home_screen.dart';
import 'package:customers_app/widgets/general_logo.dart';
import 'package:flutter/material.dart';
import 'package:customers_app/consts/theme.dart';

class Diagnosis3Pages extends StatefulWidget{

  @override
  _Diagnosis3PagesState createState() => _Diagnosis3PagesState();
}

class _Diagnosis3PagesState extends State<Diagnosis3Pages>{
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            // passing this to our root
            Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: GeneralLogo(),
          ),
          Column(
            children: [
              Image.asset("assets/splash/beauty.png", width: 250,),

              // SizedBox(),
              Text("You Have NORMAL Skin", style: regularTextStyle.copyWith(fontSize: 25, color: almondBrownColor))
              ],
            
          ),
        ]
      )  
    );
  }
}