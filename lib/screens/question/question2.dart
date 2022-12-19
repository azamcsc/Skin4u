import 'package:customers_app/screens/question/question3.dart';
import 'package:customers_app/screens/question/question8.dart';
import 'package:flutter/material.dart';
import 'package:customers_app/screens/diagnosis/diagnosis.dart';
import 'package:customers_app/widgets/button_primary.dart';
import 'package:customers_app/widgets/general_logo.dart';
import 'package:customers_app/widgets/widget_illustration.dart';
import 'package:customers_app/consts/theme.dart';

class Question2 extends StatelessWidget{

  final String ? text;
  final VoidCallback ? onTap;
  final String ? image;

  const Question2({Key? key, this.text, this.onTap, this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: GeneralLogo(),
          ),
          
          Column(
            children: [Image.asset("assets/splash/beauty-treatment.png", width: 250,)],
          ),

          // Container(
          //   Image.asset("assets/beauty-treatment.png", width: 250,)
          // ),

          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Do you have redness on your skin?", 
                  style: regularTextStyle.copyWith(fontSize: 25),
                  ),
                SizedBox(height: 8,
                ),
                Text("It might as weel feels irritating", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height:20),

                //NOTE:: TEXTFIELD
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question3()));
                  },
                  child: Text("YES"),
                  style: ElevatedButton.styleFrom(
                  primary: almondBrownColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          )
      // body: GeneralLogo(
      //   child: Column (
      //     children: [
      //       SizedBox(
      //         height: 45,
      //       ),
      //       WidgetIllustration(
      //         image: "assets/beauty-treatment.png",
      //         title: "Have you experience tightness on your skin?",
      //         subtitle1: "Usually occur after washing your face",
      //         subtitle2: "",
      //         child: ButtonPrimary
      //         (text: "YES", 
      //         onTap: (){
      //           Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question2()));
      //         },
      //         ),
      //       )
      //       ],
      //       ),
      // ),
                  ),

                  SizedBox(height: 24,),
                  Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question8()));
                  },
                  child: Text("NO"),
                  style: ElevatedButton.styleFrom(
                  primary: almondBrownColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          ))
      ]))]));


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: GeneralLogo(
  //       child: Column (
  //         children: [
  //           SizedBox(
  //             height: 45,
  //           ),
  //           WidgetIllustration(
  //             image: "assets/beauty-treatment.png",
  //             title: "Kririrn",
  //             subtitle1: "We are here to guide",
  //             subtitle2: "throughout you skin journey",
  //             child: ButtonPrimary
  //             (text: "GET STARTED", 
  //             onTap: (){
  //               Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question3()));
  //             },
  //             )
  //           ,)
  //           ],
  //           ),
  //     ),
  //     );
  }
}