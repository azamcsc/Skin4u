import 'package:customers_app/screens/appointment/state_management/beautician_model.dart';
import 'package:customers_app/screens/appointment/state_management/city_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:customers_app/screens/appointment/state_management/clinic.model.dart';
import 'package:provider/provider.dart';


//final userInformation = StateProvider((ref) => null);

//Booking state
// final currentStep = StateProvider((ref) => 1);
// final selectedCity = StateProvider((ref) => CityModel);
// final selectedClinic = StateProvider((ref) => ClinicModel);
// final selectedBeautician = StateProvider((ref) => BeauticianModel);
// final selectedDate = StateProvider((ref) => DateTime.now());
// final selectedTimeSlot = StateProvider((ref) => -1);
// final selectedTime = StateProvider((ref) => '');

class StateMangment extends ChangeNotifier{
  int currentStep=1;
   CityModel? selectedCity;
  ClinicModel? selectedClinic;
  BeauticianModel? selectedBeautician;
  DateTime selectedDate=DateTime.now();
  int selectedTimeSlot=-1;
  String selectedTime="";
  void changeCurrentStep(int value){
    currentStep=value;
    notifyListeners();
  }
  void changeSelectedCity(CityModel city){
    selectedCity=city;
    notifyListeners();
  }
  
  void changeClinicMode(ClinicModel clinic){
    selectedClinic=clinic;
    notifyListeners();
  }

  void changeBeautician(BeauticianModel beautician){
    selectedBeautician=beautician;
    notifyListeners();
  }

  void changeDate(DateTime date){
    selectedDate=date;
    notifyListeners();
  }

  void changeTimeSlot(int value){
    selectedTimeSlot=value;notifyListeners();
  }
  void changeTime(String time){
    selectedTime=time;
    notifyListeners();
  }

}