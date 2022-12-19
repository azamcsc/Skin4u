//import 'dart:html';
//import 'package:customers_app/screens/alarm.dart';
import 'package:customers_app/screens/information/info_display.dart';
import 'package:customers_app/screens/question/question1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customers_app/main.dart';
//import 'package:customers_app/model/user_model.dart';
//import 'package:customers_app/screens/setting.dart';
//import 'package:customers_app/screens/splash/splashscreen.dart';
import 'package:customers_app/widgets/category_card.dart';
import 'package:customers_app/consts/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:customers_app/widgets/constants.dart';
// import 'package:customers_app/screens/details_screen.dart';
// import 'package:customers_app/widgets/bottom_nav_bar.dart';
// import 'package:customers_app/widgets/category_card.dart';
// import 'package:customers_app/widgets/search_bar.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/general_logo.dart';
import 'appointment/doctor_details_page.dart';
//import 'login.dart';

class HomeScreen1 extends StatefulWidget{
  final VoidCallback ? onPressed;
  const HomeScreen1({Key? key, this.onPressed}) : super(key: key);

  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1>{
  User? user = FirebaseAuth.instance.currentUser;
  //UserModel loggedInUser = UserModel();

  get resizeToAvoidBottomInset => null;

  //@override
  //void initState() {
  //  super.initState();
  //  FirebaseFirestore.instance
  //      .collection("users")
  //      .doc(user!.uid)
  //      .get()
  //      .then((value) {
  //    this.loggedInUser = UserModel.fromMap(value.data());
  //    setState(() {});
  //  });
 // }

  @override
  Widget build (BuildContext){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container(
            height: size.height  *.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash/top-header.png', )
               ,)
               )
                ),
                
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(top: 40, bottom: 100),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget> [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('assets/splash/hello.png'),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Welcome!", 
                            style: lightTextStyle.copyWith(fontSize: 15, color: darkBrownColor)),
                            //Text("${loggedInUser.firstName} ${loggedInUser.secondName}", 
                            //style: boldTextStyle.copyWith(fontSize: 15, color: darkBrownColor)
                            //)
                          ],
                        )
                      ]
                      ),
                  ),

                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        CategoryCard(
                          title: "Diagnosis",
                          image: "assets/splash/skincare.png",
                          press: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){return Question1();}));
                          },
                        ),
                        CategoryCard(
                          title: "Appointment",
                          image: "assets/splash/meetings.jpg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DoctorDetailPage(); //UBAHHHH!!!!!
                              }),);
                          },
                        ),
                        CategoryCard(
                          title: "Reminder",
                          image: "assets/splash/alarm-clock.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Question1(); //UBAHHHH!!!!!
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Information",
                          image: "assets/splash/cosmetics.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return InfoPage(); //UBAHHHHHH!!!!!
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Setting",
                          image: "assets/splash/settings.jpg",
                          press: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){return Question1 ();})); //UBAHHHHH!!!!
                          },
                        ),
                      ],
                      // children: <Widget>[
                      //       GestureDetector(onTap: () {
                      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Question1())));
                      //         } ,),
                            
                            
                      //       Card(
                      //       shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(8)
                      //       ),
                      //       child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: <Widget> [
                      //             Image.asset("assets/skincare.png", height: 128,),
                      //             Text("Routine")
                      //             ]
                      //             )
                      //             ),
                                  
                      //             Card(
                      //       shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(8)
                      //       ),
                      //       child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: <Widget> [
                      //             Image.asset("assets/meetings.jpg", height: 128,),
                      //             Text("Meeting")
                      //             ]
                      //             )
                      //             ),
                                  
                      //             Card(
                      //       shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(8)
                      //       ),
                      //       child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: <Widget> [
                      //             Image.asset("assets/settings.jpg", height: 128,),
                      //             Text("Settings")
                      //             ]
                      //             )
                      //             )
                      //             ],
                                ),
            )]
            ),
                          )
      )],
                      ),
    );
  }
}