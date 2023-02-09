import 'package:flutter/material.dart';

class login_provider with ChangeNotifier{
  String email="";
  String password="";
  void login( String email,String password){
    email=email;
    password=password;
    // print( "+email+"  "+password);
    notifyListeners();
  }


}
