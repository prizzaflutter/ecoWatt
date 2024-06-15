import 'dart:io';
import 'package:ecowatt_yassine_askour_flutter/model/Admin_model.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecowatt_yassine_askour_flutter/model/SharedPreferencesModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/messages_model.dart';
import '../model/user_model.dart';
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
SharedPreferences sharedPreferences =
    SharedPreferencesService().sharedPreferences!;
String image = sharedPreferences.getString("image").toString();
String adminUID = sharedPreferences.getString("uid").toString();
String name = sharedPreferences.getString("name").toString();
String phoneNumber = sharedPreferences.getString("phoneNumber")!;
String email = sharedPreferences.getString("email").toString();
String password = sharedPreferences.getString("password").toString();
String dateOfCreateAccount =
sharedPreferences.getString("dateOfCreateAccount").toString();
AdminModel adminModel = AdminModel(
    adminUID:sharedPreferences.getString("uid").toString()
    , adminName:  sharedPreferences.getString("name").toString(),
    adminImage: sharedPreferences.getString("image").toString(),
    adminPhoneNumber:  sharedPreferences.getString("phoneNumber")!,
    adminEmail: sharedPreferences.getString("email").toString(),
    adminStatus: sharedPreferences.getString("AdminStatus").toString());

Future<SharedPreferences> getSharedPrefrences() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences;
}

class ScreenSize {
  static double? height;
  static double? width;

  static void size(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}

void handleMenuButtonPressed(
    AdvancedDrawerController advancedDrawerController) {
  // NOTICE: Manage Advanced Drawer state through the Controller.
  // _advancedDrawerController.value = AdvancedDrawerValue.visible();
  advancedDrawerController.showDrawer();
}

// get all messages
Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(String userUID) {
  final conversationID = getConversationID(adminUID, userUID);
  return firebaseFirestore
      .collection("Chats/$conversationID/messages/")
      .snapshots();
}

// for checking if the user exists or not ?
Future<bool> userExists() async {
  return (await firebaseFirestore
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .get())
      .exists;
}

String getConversationID(String id1, String id2) =>
    id1.hashCode <= id2.hashCode ? "${id1}_$id2" : "${id2}_$id1";

// String getConversationID (String id )=> uid.hashCode <= id.hashCode ? "${uid}_${id}":"${id}_${uid}";
// for sending message
Future<void> sendMessage(String fromId, String msg, String userUID, Type type) async {
  // message sending time (also used as id)
  final time = DateTime.now().millisecondsSinceEpoch.toString();

  // message to send
  final Message message = Message(
    toId: userUID,
    msg: msg,
    read: "",
    type: type,
    fromId: adminUID,
    sent: time,
  );
  final ref = firebaseFirestore
      .collection("Chats/${getConversationID(fromId, userUID)}/messages/");
  await ref.doc(time).set(message.toJson());
}

// todo  : getting formatted time from milliSecondsSinceEpochs String
String getFormattedTime({required BuildContext context, required String time}) {
  final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
  return TimeOfDay.fromDateTime(date).format(context);
}


// todo update read status of message
Future<void> updateMessageReadStatus(Message message) async {
      await firebaseFirestore
      .collection(
          "Chats/${getConversationID(message.fromId, message.toId)}/messages/")
      .doc(message.sent)
      .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});

}

// todo get only last message of specific chat
Stream<QuerySnapshot<Map<String,dynamic>>> getLastMessage (UserModel userModel){
 final conversationID = getConversationID(adminUID, userModel.userUID.toString());
  return firebaseFirestore
      .collection("Chats/$conversationID/messages/").orderBy("sent", descending: true).limit(1).snapshots();

}
String getLastMessageTime(
    {required BuildContext context, required String time}) {
  final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
  final DateTime now = DateTime.now();
  if (now.day == sent.day && now.month == sent.month && now.year == sent.year) {
    return TimeOfDay.fromDateTime(sent).format(context);
  }
  return "${sent.day} ${getMonth(sent)}";
}

String getMonth (DateTime date){
  switch (date.month){
    case 1 :
      return "Jan";
    case 2 :
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "Apr";
    case 5 :
      return "May";
    case 6 :
      return "Jun";
    case 7 :
      return "Jul";
    case 8 :
      return "Aug";
    case 9 :
      return "Sept";
    case 10 :
      return "Oct";
    case 11 :
      return "Nov";
    case 12 :
      return "Dec";
  }
  return "NA";
}
Future<void> sendChatImage (UserModel userModel,File file)async{
  // getting image from extension
  final ext = file.path.split(".").last;
  final conversationID =
  getConversationID(adminUID, userModel.userUID.toString());
  // storage file ref with path
  final ref =  storage.ref().child("images/${conversationID}/${DateTime.now().millisecondsSinceEpoch}.$ext");
  //uploading image
  await ref.putFile(
      file , SettableMetadata(contentType: "image/$ext")
  ).then((p0){
     ("Data Transferred : ${p0.bytesTransferred / 1000} kb");
  });

  // updating image in firestore database
  final imageUrl = await ref.getDownloadURL();
  await  sendMessage(adminUID, imageUrl, userModel.userUID!, Type.image);
}

String format_Date(DateTime date){
  return DateFormat('yyyy-MM-dd').format(date);
}