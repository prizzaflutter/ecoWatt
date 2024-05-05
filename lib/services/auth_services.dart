import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/global.dart';
import '../model/user_model.dart';
class AuthService {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();

  Future<UserModel?> signUpUser (String email , String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null){
        await firebaseUser.sendEmailVerification();
        await auth.signOut();
        return  UserModel(
          userUID: firebaseUser.uid,
          userEmail: firebaseUser.email,
          userStatus: sharedPreferences.getString("UserStatus"),
          userImage: sharedPreferences.getString("UserImage"),
          userName: sharedPreferences.getString("UserName"),
        );
      }else {
        debugPrint("firebaseUser == Null");
      }
    }on FirebaseAuthException catch (error){
      debugPrint("From AuthService => SignUpUser : ${error.code}");
    }catch (exception){
      debugPrint(exception.toString());
    }
    return null;
  }
  Future<UserModel?> logInUser (String email , String password)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try{
      final UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null){
        debugPrint("firebaseUser != null -------------------------------");
        await LoginScreen.getDataAndSetLocally(firebaseUser.uid);
        return  UserModel(
          userUID: firebaseUser.uid,
          userEmail: firebaseUser.email,
          userStatus: sharedPreferences.getString("UserStatus"),
          userImage: sharedPreferences.getString("UserImage"),
          userName: sharedPreferences.getString("UserName"),
        );
      }
    }on FirebaseException catch (error){
      if (error.code == "user-not-found"){
        debugPrint("user-not-found");
      }else if (error.code == "wrong-password"){
        debugPrint("Wrong-password");
        _scaffoldKey.currentState?.showSnackBar(const SnackBar(content: Text("Wrong password provided for that user")));
      }
    }catch (exception){debugPrint(exception.toString());}
    return null ;
  }
  Future<UserModel?> signOutUser() async{
    if (auth.currentUser != null){
      await auth.signOut();
    }else {
      debugPrint("The user  == null => from SignOutUser => AuthService");
    }
    return null;
  }
}
