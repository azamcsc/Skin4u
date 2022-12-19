import 'package:cloud_firestore/cloud_firestore.dart'; 

class CityModel{
  late String name, address;

  CityModel({
    required this.name, 
    required this.address});

  CityModel.fromJson(Map<String, dynamic> json){
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
}