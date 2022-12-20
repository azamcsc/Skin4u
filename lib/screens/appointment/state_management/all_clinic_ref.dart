import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customers_app/screens/appointment/state_management/beautician_model.dart';
import 'package:customers_app/screens/appointment/state_management/city_model.dart';
import 'package:customers_app/screens/appointment/state_management/clinic.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<CityModel>> getCities() async {
  var cities = <CityModel>[];

  /// why the app is crashing ????
  var cityRef = FirebaseFirestore.instance.collection('AllClinic');
  var snapshot = await cityRef.get();

  snapshot.docs.forEach((element) {
    cities.add(CityModel.fromJson(element.data()));
  });
  return cities;
}

Future<List<ClinicModel>> getClinicCity(String cityName) async {
  var clinics = <ClinicModel>[];
  var clinicRef = FirebaseFirestore.instance
      .collection('AllClinic')
      .doc(cityName.replaceAll(' ', ''))
      .collection('Branch');
  var snapshot = await clinicRef.get();
  snapshot.docs.forEach((element) {
    var clinic = ClinicModel.fromJson(element.data());
    print("element ${clinic.name}");
    clinic.docId = element.id;
    clinic.reference = element.reference;
    print(clinic.toJson());
    clinics.add(clinic);
  });
  print(clinics);
  return clinics;
}

Future<List<BeauticianModel>> getBeauticianbyClinic(
    ClinicModel clinic, String cityName, String docId) async {
  print("id $docId");
  print("city name is $cityName");
  var beautician = new List<BeauticianModel>.empty(growable: true);
  // var beauticianRef = FirebaseFirestore.instance
  // .collection("AllClinic")
  // .doc(cityName.replaceAll(" ", ""))
  // .collection("Branch")
  // .doc(docId)
  // .collection("Beautician");
  var beauticianRef = clinic.reference.collection("Beautician");
  // .collection('AllClinic')
  // .doc(cityName.replaceAll(' ', ''))
  // .collection('Branch')
  // .doc(docId)
  // .collection('Beautician');
  var snapshot = await beauticianRef.get();
  print("beauti length is ${snapshot.docs.length}");
  snapshot.docs.forEach((element) {
    var beautician = BeauticianModel.fromJson(element.data());
    beautician.docId = element.id;
    beautician.reference = element.reference;
    beautician.add(beautician);
  });
  return beautician;
}

Future<List<int>> getTimeSlotOfBeautician(
    BeauticianModel beauticianModel, String date) async {
  List<int> result = new List<int>.empty(growable: true);
  var bookingRef = beauticianModel.reference.collection(date);
  QuerySnapshot snapshot = await bookingRef.get();
  snapshot.docs.forEach((element) {
    result.add(int.parse(element.id));
  });
  return result;
}
