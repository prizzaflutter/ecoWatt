import 'package:ecowatt_yassine_askour_flutter/global/global.dart';

class reportService{
  Stream(){
    return firebaseFirestore.collection("Users").snapshots();
  }
}