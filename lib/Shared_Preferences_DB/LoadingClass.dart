import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Classes/colors.dart';
import 'package:intl/intl.dart';
import '../classes/data.dart';





class UserSecureStorage {
  static final _storage = FlutterSecureStorage();


  static Future checkFirstTimeWrite() async {
      await _storage.write(key: "CheckFirstTimeIvoryWalletMobileApp", value: "true");
  }


  static Future setAll() async {
    await _storage.write(key: "MobileNumberCardioXApp", value: User_Data_Object.mobile_number.toString());
    return 0;
  }
  //
  static GetAll() async {
    int Bool =1;
    await _storage.write(key: "MobileNumberCardioXApp", value: User_Data_Object.mobile_number.toString());
    final MobileNumber = await _storage.read(key: "MobileNumberCardioXApp");

    if(MobileNumber!=null){
      User_Data_Object.mobile_number = MobileNumber;
    }else{
      Bool=2;
    }


    return Bool;
  }


}

