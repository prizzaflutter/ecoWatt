import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/auth_screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/global.dart';
import '../model/Admin_model.dart';
class AuthService {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();

  Future<AdminModel?> signUpAdmin (String email , String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      final User? firebaseAdmin = userCredential.user;
      if (firebaseAdmin != null){
        await firebaseAdmin.sendEmailVerification();
        await auth.signOut();
        return  AdminModel(
          adminUID: firebaseAdmin.uid,
          adminEmail: firebaseAdmin.email,
          adminStatus: sharedPreferences.getString("AdminStatus"),
          adminImage: sharedPreferences.getString("AdminImage"),
          adminName: sharedPreferences.getString("AdminName"),
          adminPhoneNumber: sharedPreferences.getString("AdminPhoneNumber"),
        );
      }else {
         ("firebaseAdmin == Null");
      }
    }on FirebaseAuthException catch (error){
       ("From AuthService => SignUpAdmin : ${error.code}");
    }catch (exception){
       (exception.toString());
    }
    return null;
  }
  Future<AdminModel?> logInAdmin (String email , String password ,  {required BuildContext context})async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try{
      final UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      final User? firebaseAdmin = userCredential.user;
      if (firebaseAdmin != null){
         ("firebaseAdmin != null -------------------------------");
        await LoginScreen.getDataAndSetLocally(firebaseAdmin.uid, context : context);
        return  AdminModel(
          adminUID: firebaseAdmin.uid,
          adminEmail: firebaseAdmin.email,
          adminStatus: sharedPreferences.getString("AdminStatus"),
          adminImage: sharedPreferences.getString("AdminImage"),
          adminName: sharedPreferences.getString("AdminName"),
          adminPhoneNumber: sharedPreferences.getString("AdminPhoneNumber"),
        );
      }
    }on FirebaseException catch (error){
      if (error.code == "Admin-not-found"){
         ("Admin-not-found");
      }else if (error.code == "wrong-password"){
         ("Wrong-password");
        _scaffoldKey.currentState?.showSnackBar(const SnackBar(content: Text("Wrong password provided for that Admin")));
      }
    }catch (exception){ (exception.toString());}
    return null ;
  }
  Future<AdminModel?> signOutAdmin() async{
    if (auth.currentUser != null){
      await auth.signOut();
    }else {
       ("The admin  == null => from signOutAdmin => AuthService");
    }
    return null;
  }
}
