//import 'dart:js';

import 'package:customers_app/screens/appointment/state_management/all_clinic_ref.dart';
import 'package:customers_app/screens/appointment/state_management/beautician_model.dart';
import 'package:customers_app/screens/appointment/state_management/city_model.dart';
import 'package:customers_app/screens/appointment/state_management/clinic.model.dart';
import 'package:customers_app/screens/appointment/state_management/state_management.dart';
import 'package:customers_app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart' as Provider;
import 'package:provider/provider.dart';

class BookingScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> ScaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    //watch
    var step = Provider.Provider.of<StateMangment>(context).currentStep;
    var cityWatch = Provider.Provider.of<StateMangment>(context).selectedCity;
    var clinicWatch =
        Provider.Provider.of<StateMangment>(context).selectedClinic;
    var beauticianWatch =
        Provider.Provider.of<StateMangment>(context).selectedBeautician;
    var dateWatch = Provider.Provider.of<StateMangment>(context).selectedDate;
    var timeWatch = Provider.Provider.of<StateMangment>(context).selectedTime;

    //var test = Provider.Provider.of<StateMangment>(context).selectedCity;

    return SafeArea(
      child: Scaffold(
        key: ScaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            NumberStepper(
              activeStep: step - 1,
              direction: Axis.horizontal,
              enableNextPreviousButtons: false,
              enableStepTapping: false,
              numbers: [1, 2, 3, 4, 5],
              stepColor: Colors.black,
              activeStepColor: Colors.brown,
              numberStyle: TextStyle(color: Colors.white),
            ),

            //Screen
            Expanded(
                flex: 10,
                child: step == 1
                    ? displayCityList()
                    : step == 2
                        ? displayClinic(cityWatch!.name)
                        : step == 3
                            ? displayBeautician(clinicWatch!, cityWatch!.name)
                            : step == 4
                                ? displayTimeSlot(
                                    context, beauticianWatch as BeauticianModel)
                                : step == 5
                                    ? displayConfirm(context)
                                    //(Provider.Provider.of<StateMangment>(context).selectedClinic)
                                    : Container()),

            //Button
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: step == 1
                            ? null
                            : () => Provider.Provider.of<StateMangment>(context,
                                    listen: false)
                                .changeCurrentStep(
                                    Provider.Provider.of<StateMangment>(context,
                                                listen: false)
                                            .currentStep -
                                        1),
                        child: Text('Previous'),
                      )),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (step == 1 && Provider.Provider.of<StateMangment>(context, listen: false).selectedCity?.name == null) ||
                                  (step == 2 &&
                                      Provider.Provider.of<StateMangment>(context, listen: false)
                                              .selectedClinic
                                              ?.docId ==
                                          null) ||
                                  (step == 3 &&
                                      Provider.Provider.of<StateMangment>(context, listen: false)
                                              .selectedBeautician
                                              ?.docId ==
                                          null) ||
                                  (step == 4 &&
                                      Provider.Provider.of<StateMangment>(context, listen: false)
                                              .selectedTimeSlot ==
                                          -1)
                              ? null
                              : step == 5
                                  ? null
                                  : () => Provider.Provider.of<StateMangment>(context,
                                          listen: false)
                                      .changeCurrentStep(
                                          Provider.Provider.of<StateMangment>(context, listen: false).currentStep + 1),
                          child: Text('Next'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  displayCityList() {
    return FutureBuilder(
        future: getCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var cities = snapshot.data as List<CityModel>;
            if (cities == null || cities.length == 0)
              return Center(
                child: Text('Cannot Load City List'),
              );
            else
              return ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Provider.Provider.of<StateMangment>(context,
                              listen: false)
                          .changeSelectedCity(cities[index]),
                      child: Card(
                          child: ListTile(
                        leading: Icon(
                          Icons.home_work,
                          color: Colors.black,
                        ),
                        trailing: Provider.Provider.of<StateMangment>(context)
                                    .selectedCity
                                    ?.name ==
                                cities[index].name
                            ? Icon(Icons.check)
                            : null,
                        title: Text(
                          '${cities[index].name}',
                          style: GoogleFonts.robotoMono(),
                        ),
                      )),
                    );
                  });
          }
        });
  }

  displayClinic(String cityName) {
    return FutureBuilder(
        future: getClinicCity(cityName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var clinic = snapshot.data as List<ClinicModel>;
            print("Clinic is ${clinic}");
            if (clinic == null || clinic.length == 0)
              return Center(
                child: Text('Cannot Load Clinic List'),
              );
            else
              return ListView.builder(
                itemCount: clinic.length,
                itemBuilder: (context, index) {
                  print("doc id is ${clinic[index].docId}");
                  return GestureDetector(
                    onTap: () => Provider.Provider.of<StateMangment>(context,
                            listen: false)
                        .changeClinicMode(clinic[index]),
                    child: Card(
                        child: ListTile(
                      leading: Icon(
                        Icons.spa_sharp,
                        color: Colors.black,
                      ),
                      trailing: Provider.Provider.of<StateMangment>(context)
                                  .selectedClinic
                                  ?.docId ==
                              clinic[index].docId
                          ? Icon(Icons.check)
                          : null,
                      title: Text(
                        '${clinic[index].name}',
                        style: GoogleFonts.robotoMono(),
                      ),
                      subtitle: Text(
                        '${clinic[index].address}',
                        style:
                            GoogleFonts.robotoMono(fontStyle: FontStyle.italic),
                      ),
                    )),
                  );
                },
              );
          }
        });
  }

  displayBeautician(ClinicModel clinicModel, String cityName) {
    return FutureBuilder(
        future: getBeauticianbyClinic(clinicModel, cityName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var beautician = snapshot.data as List<BeauticianModel>;
            if (beautician == null || beautician.length == 0)
              return Center(
                child: Text('Beautician list is empty'),
              );
            else
              return GestureDetector(
                //onTap: ()=> Provider.Provider.of<StateMangment>(context).selectedCity,
                child: ListView.builder(
                    itemCount: beautician.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            Provider.Provider.of<StateMangment>(context)
                                .selectedBeautician ==
                            beautician[index].name,
                        child: Card(
                            child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          trailing: Provider.Provider.of<StateMangment>(context)
                                      .selectedBeautician ==
                                  beautician[index].docId
                              ? Icon(Icons.check)
                              : null,
                          title: Text(
                            '${beautician[index].name}',
                            style: GoogleFonts.robotoMono(),
                          ),
                          subtitle: RatingBar.builder(
                            itemSize: 16,
                            allowHalfRating: true,
                            initialRating: beautician[index].rating,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            onRatingUpdate: (value) {},
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemPadding: const EdgeInsets.all(4),
                          ),
                        )),
                      );
                    }),
              );
          }
        });
  }

  displayTimeSlot(BuildContext context, BeauticianModel beauticianModel) {
    var now = Provider.Provider.of<StateMangment>(context).selectedDate;
    return Column(
      children: [
        Container(
          color: Colors.brown,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(children: [
                  Text(
                    '${DateFormat.MMMM().format(now)}',
                    style: GoogleFonts.robotoMono(color: Colors.white),
                  ),
                  Text(
                    '${now.day}',
                    style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    '${DateFormat.EEEE().format(now)}',
                    style: GoogleFonts.robotoMono(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: now,
                          maxTime: now.add(Duration(days: 31)),
                          onConfirm: (date) =>
                              Provider.Provider.of<StateMangment>(context)
                                  .selectedDate ==
                              date);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ))
          ]),
        ),
        Expanded(
          child: FutureBuilder(
            future: getTimeSlotOfBeautician(
                beauticianModel,
                DateFormat('dd_MM_yyyy').format(
                    Provider.Provider.of<StateMangment>(context).selectedDate)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                var listTimeSlot = snapshot.data as List<int>;

                return GridView.builder(
                  itemCount: TIME_SLOT.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: ((context, index) => GestureDetector(
                      onTap: listTimeSlot.contains(index)
                          ? null
                          : () {
                              Provider.Provider.of<StateMangment>(context)
                                  .selectedTime = TIME_SLOT.elementAt(index);
                            },
                      child: Card(
                        color: Provider.Provider.of<StateMangment>(context)
                                    .selectedTime ==
                                TIME_SLOT.elementAt(index)
                            ? Colors.white54
                            : Colors.white,
                        child: GridTile(
                          child: Center(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${TIME_SLOT.elementAt(index)}'),
                              Text(listTimeSlot.contains(index)
                                  ? 'Occupied'
                                  : 'Available'),
                            ],
                          )),
                          header: Provider.Provider.of<StateMangment>(context)
                                      .selectedTime ==
                                  TIME_SLOT.elementAt(index)
                              ? Icon(Icons.check)
                              : null,
                        ),
                      ))),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  confirmBooking(BuildContext context) {
    var timeStamp = DateTime(
      Provider.Provider.of<StateMangment>(context).selectedDate.year,
      Provider.Provider.of<StateMangment>(context).selectedDate.month,
      Provider.Provider.of<StateMangment>(context).selectedDate.day,
      int.parse(Provider.Provider.of<StateMangment>(context)
          .selectedTime
          .split(':')[0]
          .substring(0, 2)), //hour
      int.parse(Provider.Provider.of<StateMangment>(context)
          .selectedTime
          .split(':')[1]
          .substring(0, 2)), //minute
    ).millisecond;

    var submitData = {
      'beauticianId':
          Provider.Provider.of<StateMangment>(context).selectedBeautician,
      'beauticianName':
          Provider.Provider.of<StateMangment>(context).selectedBeautician!.name,
      'cityBook':
          Provider.Provider.of<StateMangment>(context).selectedCity!.name,
      //'name': Provider.Provider.of<StateMangment>(context).selectedBeautician.name,
      'clinicAddress':
          Provider.Provider.of<StateMangment>(context).selectedClinic!.address,
      'clinicId':
          Provider.Provider.of<StateMangment>(context).selectedClinic!.docId,
      'clinicName':
          Provider.Provider.of<StateMangment>(context).selectedClinic!.name,
      'slot': Provider.Provider.of<StateMangment>(context).selectedTimeSlot,
      'timeStamp': timeStamp,
      'time':
          '${Provider.Provider.of<StateMangment>(context).selectedTime} - ${DateFormat('dd/MM/yyyy').format(Provider.Provider.of<StateMangment>(context).selectedDate)}'
    };
    //Submit on Firestore
    Provider.Provider.of<StateMangment>(context)
        .selectedBeautician!
        .reference
        .collection(
            '${DateFormat('dd_MM_yyyy').format(Provider.Provider.of<StateMangment>(context).selectedDate)}')
        .doc(Provider.Provider.of<StateMangment>(context)
            .selectedTimeSlot
            .toString())
        .set(submitData)
        .then((value) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Booking Successfully'),
      ));
      //Reset value
      // Provider.Provider.of<StateMangment>(context).selectedDate;
      // Provider.of<selectedDate>(context = DateTime.now();
      // Provider.Provider.of<StateMangment>(context).selectedBeautician = BeauticianModel();
      // Provider.Provider.of<StateMangment>(context).selectedCity = CityModel;
      // Provider.Provider.of<StateMangment>(context).selectedClinic = ClinicModel;
      // Provider.Provider.of<StateMangment>(context).currentStep = 1;
      // Provider.Provider.of<StateMangment>(context).selectedTime = '';
      // Provider.Provider.of<StateMangment>(context). = -1;
    });
  }

  displayConfirm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(24),
          child: Image.asset('assets/splash/logo.png'),
        )),
        Expanded(
            child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Text(
                'See you during our consultation session.',
                style: GoogleFonts.robotoMono(fontWeight: FontWeight.bold),
              ),
              Text(
                'Booking Information',
                style: GoogleFonts.robotoMono(),
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${Provider.Provider.of<StateMangment>(context).selectedTime} - ${DateFormat('dd_MM_yyyy').format(Provider.Provider.of<StateMangment>(context).selectedDate)}}' //hour}',
                    ,
                    style: GoogleFonts.robotoMono(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${Provider.Provider.of<StateMangment>(context).selectedBeautician!.name}',
                    style: GoogleFonts.robotoMono(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                children: [
                  Icon(Icons.spa),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${Provider.Provider.of<StateMangment>(context).selectedClinic!.name}',
                    style: GoogleFonts.robotoMono(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_city),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${Provider.Provider.of<StateMangment>(context).selectedClinic!.address}',
                    style: GoogleFonts.robotoMono(),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => confirmBooking(context),
                child: Text('Confirm'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black26)),
              )
            ]),
          )),
        ))
      ],
    );
  }
}
