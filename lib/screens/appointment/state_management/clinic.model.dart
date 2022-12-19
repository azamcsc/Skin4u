import 'package:cloud_firestore/cloud_firestore.dart';

class ClinicModel{
  late String name, address, docId;
  late DocumentReference reference;

  ClinicModel({
    required this.name, 
    required this.address});

  ClinicModel.fromJson(Map<String, dynamic> json){
    address = json['address'];
    name = json['name'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = 
    //new Map
    <String,dynamic>{};
    data ['name'] = this.name;
    return data;
  }

  void add(ClinicModel clinic) {}
}