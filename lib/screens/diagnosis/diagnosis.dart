
import 'package:customers_app/screens/home_screen1.dart';
import 'package:customers_app/widgets/general_logo.dart';
import 'package:flutter/material.dart';
import 'package:customers_app/consts/theme.dart';


class DiagnosisPages extends StatefulWidget{

  @override
  _DiagnosisPagesState createState() => _DiagnosisPagesState();
}

class _DiagnosisPagesState extends State<DiagnosisPages>{
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
            Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => HomeScreen1()));
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
              Text("You Have DRY Skin", style: regularTextStyle.copyWith(fontSize: 25, color: almondBrownColor)
          )],
            
          ),
        ]
      )  
    );
  }
}