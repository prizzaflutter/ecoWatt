import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecowatt_yassine_askour_flutter/model/SharedPreferencesModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/messages_model.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore =  FirebaseFirestore.instance;
SharedPreferences sharedPreferences = SharedPreferencesService().sharedPreferences!;
String image = sharedPreferences.getString("image").toString();
String uid = sharedPreferences.getString("uid").toString();
String name = sharedPreferences.getString("name").toString();
String phoneNumber = sharedPreferences.getString("phoneNumber")!;
String email = sharedPreferences.getString("email").toString();
String password = sharedPreferences.getString("password").toString();
String dateOfCreateAccount = sharedPreferences.getString("dateOfCreateAccount").toString();
late String  GlobalUserUID;

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
// get all messages
Stream<QuerySnapshot<Map<String,dynamic>>> getAllMessages(String uid){
  return firebaseFirestore.collection("Chats/${getConversationID(uid,GlobalUserUID)}/messages/").snapshots();
}
// for checking if the user exists or not ?
Future<bool> userExists()async{
  return (await firebaseFirestore.collection("Users").doc(auth.currentUser!.uid).get()).exists;
}
String getConversationID(String id1, String id2) =>
    id1.hashCode <= id2.hashCode ? "${id1}_$id2" : "${id2}_$id1";

// String getConversationID (String id )=> uid.hashCode <= id.hashCode ? "${uid}_${id}":"${id}_${uid}";
// for sending message
Future<void> sendMessage(String fromId , String msg , String userUID) async {
  // message sending time (also used as id)
  final time = DateTime.now().millisecondsSinceEpoch.toString();

  // message to send
  final Message message = Message(
    toId: userUID,
    msg: msg,
    read:  "",
    type: Type.text,
    fromId: uid,
    sent: time,
  );
  final ref = firebaseFirestore.collection("Chats/${getConversationID(uid,GlobalUserUID)}/messages/");
  await ref.doc(time).set(message.toJson());
}