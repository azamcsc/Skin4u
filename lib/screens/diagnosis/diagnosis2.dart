import 'package:customers_app/screens/home_screen.dart';
//import 'package:customers_app/screens/product_suggestion/product_details.dart';
import 'package:customers_app/widgets/general_logo.dart';
import 'package:flutter/material.dart';
import 'package:customers_app/consts/theme.dart';

class Diagnosis2Pages extends StatefulWidget{

  @override
  _Diagnosis2PagesState createState() => _Diagnosis2PagesState();
}

class _Diagnosis2PagesState extends State<Diagnosis2Pages>{
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
              Text("You Have OILY Skin", style: regularTextStyle.copyWith(fontSize: 25, color: almondBrownColor)),
              SizedBox(height: 24,),
                  Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => HomeScreen()));
                  },
                  child: Text("Product Suggestion"),
                  style: ElevatedButton.styleFrom(
                  primary: almondBrownColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          ))
              ],
    
          ),
        ]
      )  
    );
  }
}