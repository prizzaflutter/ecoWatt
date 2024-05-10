import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecowatt_yassine_askour_flutter/model/SharedPreferencesModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore =  FirebaseFirestore.instance;
SharedPreferences sharedPreferences = SharedPreferencesService().sharedPreferences!;
String image = sharedPreferences.getString("image").toString();
String name = sharedPreferences.getString("name").toString();
String phoneNumber = sharedPreferences.getString("phoneNumber")!;
String email = sharedPreferences.getString("email").toString();
String password = sharedPreferences.getString("password").toString();
String dateOfCreateAccount = sharedPreferences.getString("dateOfCreateAccount").toString();

Future<SharedPreferences> getSharedPrefrences() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences;
}

class ScreenSize {
  static double? height;
  static double? width;
   static void size (BuildContext context){
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}

void handleMenuButtonPressed(AdvancedDrawerController advancedDrawerController) {
  // NOTICE: Manage Advanced Drawer state through the Controller.
  // _advancedDrawerController.value = AdvancedDrawerValue.visible();
  advancedDrawerController.showDrawer();
}