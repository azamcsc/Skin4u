//import 'package:email_password_login/screens/question/question2.dart';
import 'package:customers_app/screens/information/splash/splashscreen1.dart';
//import 'package:email_password_login/widgets/button_secondary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:email_password_login/screens/diagnosis/diagnosis.dart';
//import 'package:email_password_login/widgets/button_primary.dart';
//import 'package:email_password_login/widgets/button_secondary.dart';
//import 'package:email_password_login/widgets/general_logo.dart';
//import 'package:email_password_login/widgets/widget_illustration.dart';
import 'package:customers_app/consts/theme.dart';

class SplashScreen extends StatelessWidget{
  final String ? text;
  // final VoidCallback ? onTap;
  final String ? image;

  const SplashScreen({Key? key, this.text, this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView(
      //   children: [
      //     Container(
      //       child: GeneralLogo(),
      //     ),
      //     Column(
      //       children: [Image.asset("assets/OIP.jpg", width: 250,)],
      //     ),

          backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_forward, color: Colors.red),
          onPressed: () {
            // passing this to our root
            Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => SplashScreen1()));
          },
        ),
      ),body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Container(
                child: Image.asset("assets/splash/OIP.jpg", width: 250,)
                  ),
                Text(
                  "5 Crucial Steps In Skincare!", 
                  style: regularTextStyle.copyWith(fontSize: 25, color: black),
                  ),
                SizedBox(height: 8,
                ),
                Text("1. Cleanse - Gently removes makeup and embedded impurities, while leaving skin velvety smooth!", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                Text("2. Tone - Wrapping up the cleansing process, removing that last bit of dirt and oil sitting deep in your pores.", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                Text("3. Treat - A boost of hydration and nutrients with an essence, an Asian beauty secret that promotes surface skin cell renewal.", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                Text("4. Target - Target your biggest problem areas with a serum. Whatever your skin concern is, there is a serum for you.", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                Text("5. Moisturize - With daily use, skin becomes firmer, smoother and more radiant and fine lines and wrinkles appear less defined.", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height:20),

                //NOTE:: TEXTFIELD
          //       Container(
          //         width: MediaQuery.of(context).size.width - 100,
          //         height: 50,
          //         child: ElevatedButton(
          //         onPressed: (){
          //           Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question2()));
          //         },
          //         child: Text("YES"),
          //         style: ElevatedButton.styleFrom(
          //         primary: almondBrownColor,
          //         shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20))),
          // )
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
//                   ),

//                   SizedBox(height: 24,),
//                   Container(
//                   width: MediaQuery.of(context).size.width - 100,
//                   height: 50,
//                   child: ElevatedButton(
//                   onPressed: (){
//                     Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question2()));
//                   },
//                   child: Text("NO"),
//                   style: ElevatedButton.styleFrom(
//                   primary: almondBrownColor,
//                   shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20))),
//           ))
//       ]))]));
      
//   }
// }


// // import 'package:email_password_login/screens/home_screen.dart';
// // import 'package:flutter/material.dart';
// // //import 'package:email_password_login/screens/register_page.dart';
// // import 'package:email_password_login/widgets/theme.dart';
// // import 'package:email_password_login/widgets/general_logo.dart';
// // import 'package:email_password_login/widgets/widget_illustration.dart';

// // class SplashScreen extends StatelessWidget{

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: GeneralLogo(
// //         child: Column (
          
// //           children: [
// //             SizedBox(
// //               height: 45,
// //             ),
// //             Container(
// //             padding: EdgeInsets.all(24),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: [
// //                 Text(
// //                   "Do you often feel the tightness on your skin?", 
// //                   style: regularTextStyle.copyWith(fontSize: 25),
// //                   ),
// //                 SizedBox(height: 8,
// //                 ),
// //                 Text("It is usually occur when you wash your face", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
// //                 ),
// //                 SizedBox(height:20),
// //             // WidgetIllustration(
// //             //   image: "assets/OIP.jpg",
// //             //   title: "5 important steps in your routine!",
// //             //   subtitle1: "1.Cleanse",
// //             //   subtitle2: "Gently removes makeup and embedded impurities, while leaving skin velvety smooth!",
// //             //   // child: ButtonPrimary
// //             //   // (text: "GET STARTED", 
// //             //   // onTap: (){
// //             //   //   Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => HomeScreen()));
// //             //   // },
// //             //   ),
// //             //   SizedBox(
// //             //   height: 10,
// //             // ),
// //             // WidgetIllustration(
// //             //   //image: "assets/OIP.jpg",
// //             //   //title: "5 important steps in your routine!",
// //             //   subtitle1: "2.Tone",
// //             //   subtitle2: "Wrapping up the cleansing process, removing that last bit of dirt and oil sitting deep in your pores.",
// //             //   // child: ButtonPrimary
// //             //   // (text: "GET STARTED", 
// //             //   // onTap: (){
// //             //   //   Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => HomeScreen()));
// //             //   // },
// //             //   ),
// //             //   SizedBox(
// //             //   height: 10,
// //             // ),
// //             // WidgetIllustration(
// //             //   //image: "assets/OIP.jpg",
// //             //   //title: "5 important steps in your routine!",
// //             //   subtitle1: "3.Treat",
// //             //   subtitle2: "A boost of hydration and nutrients with an essence, an Asian beauty secret that promotes surface skin cell renewal.",
// //             //   // child: ButtonPrimary
// //             //   // (text: "GET STARTED", 
// //             //   // onTap: (){
// //             //   //   Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => HomeScreen()));
// //             //   // },
// //             //   ),
// //             //   SizedBox(
// //             //   height: 10,
// //             // ),
// //             // WidgetIllustration(
// //             //   //image: "assets/OIP.jpg",
// //             //   //title: "5 important steps in your routine!",
// //             //   subtitle1: "4.Target",
// //             //   subtitle2: "Target your biggest problem areas with a serum. Whatever your skin concern is, there is a serum for you.",
// //             //   // child: ButtonPrimary
// //             //   // (text: "GET STARTED", 
// //             //   // onTap: (){
// //             //   //   Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => HomeScreen()));
// //             //   // },
// //             //   ),
// //             //   SizedBox(
// //             //   height: 10,
// //             // ),
// //             // WidgetIllustration(
// //             //   //image: "assets/OIP.jpg",
// //             //   //title: "5 important steps in your routine!",
// //             //   subtitle1: "5. Moisturize",
// //             //   subtitle2: "With daily use, skin becomes firmer, smoother and more radiant and fine lines and wrinkles appear less defined.",
// //             //   // child: ButtonPrimary
// //             //   // (text: "GET STARTED", 
// //             //   // onTap: (){
// //             //   //   Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => HomeScreen()));
// //             //   // },
// //             //   ),
// //             ]),
// //             ),
// //       ])));
// //   }
])))));}}