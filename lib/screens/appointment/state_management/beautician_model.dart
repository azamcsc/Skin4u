import 'package:cloud_firestore/cloud_firestore.dart';

class BeauticianModel {
  late String userName, name, docId;
  late double rating;
  late int ratingTimes;

  late DocumentReference reference;

  BeauticianModel();

    BeauticianModel.fromJson(Map<String, dynamic> json){
    userName = json['userName'];
    name = json['name'];
    rating = double.parse(json['rating'] == null ? '0' : json ['rating'].toString());
    ratingTimes = int.parse(json['ratingTimes'] == null ? '0' : json ['ratingTimes'].toString());
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = 
    //new Map
    <String,dynamic>{};
    data ['name'] = this.name;
    data ['userName'] = this.userName;
    data ['rating'] = this.rating;
    data ['ratingTimes'] = this.ratingTimes;
    return data;
  }

  void add(BeauticianModel beautician) {}

}