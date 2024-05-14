import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/services/auth_services.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/signup_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/signup_screen1.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Admin_model.dart';


part 'admin_event.dart';

part 'admin_state.dart';

mixin SignUpBloc on Bloc<AdminEvent, AdminState> {}
mixin LogInBloc on Bloc<AdminEvent , AdminState>{}
final AuthService authService = AuthService();
class AdminBloc extends Bloc<AdminEvent, AdminState> with SignUpBloc , LogInBloc {
  AdminBloc() : super(AdminInitial()) {
    on<SignUpAdminEvent>(_signUpAdminEvent);
    on<LogInAdminEvent>(_logInAdminEvent);
  }

  FutureOr<void> _signUpAdminEvent(
      SignUpAdminEvent event, Emitter<AdminState> emit) async {
    emit(DataLoadingState(true));
    try {
      final AdminModel? admin = await authService.signUpAdmin(
          event.email.trim(), event.password.trim());
      if (admin != null){
        debugPrint("Admin!= null------------------------------------");
        await  saveImageToStorage(admin.adminUID.toString()).then((value) async{
          debugPrint(" save Info To FireStore ------------------------------------");
           await saveInfoToFireStore(admin.adminUID.toString());
        });
        emit(DataLoadedState(admin));
      }else {emit(DataLoadingErrorSate("Create Admin Failed (Admin == null)"));}
    } on FirebaseException catch (exception){
      debugPrint("The error is : ${exception.toString()}");
    }
  }
FutureOr<void> _logInAdminEvent(
    LogInAdminEvent event,
  Emitter<AdminState> emit, ) async {
  emit(DataLoadingState(true));
  try {
    final AdminModel? admin = await authService.logInAdmin(event.email, event.password, context : event.context);
    if (admin != null) {
      debugPrint("Admin!=null------------------------------------------------");
      emit(DataLoadedState(admin));
    } else {
      debugPrint("DAtaLoadingErrorStae emited------------------------------------");
      emit(DataLoadingErrorSate("Create Admin Failed"));
    }
  } catch (error) {
    debugPrint("The Error is : ${error.toString()}");
  }
}

Future saveImageToStorage(String id) async {
  final filePath = SignUpScreen.imagePath;
  final file = filePath;
  final SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
  final Reference storageRef = FirebaseStorage.instance.ref();
  final imagePath = storageRef.child("Admin/$id/image.jpeg");
  UploadTask uploadTask = imagePath.putFile(file!, metadata);
  await uploadTask.whenComplete(() {});
  String url = await imagePath.getDownloadURL();
  SignUpScreen.imageDownloadUrl = url.toString() ;
  uploadTask.snapshotEvents.listen((taskSnapshot) async {
    switch (taskSnapshot.state) {
      case TaskState.running:
        const Center(
            child: SizedBox(
          height: 100,
          width: 100,
          child: Text("Data Loading...."),
        ));
        break;
      case TaskState.paused:
        const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Text("Data Paused ...."),
            ));
        break;
      case TaskState.canceled:
        const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Text("Data Canceled ...."),
            ));
        break;
        case TaskState.error:
      const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Text("There is an error on Data...."),
          ));
      break;
      case TaskState.success:
      const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Text("Data Cuccess ...."),
          ));
      break;

    }
  });
}

// save the data to firebaseFireStore
Future saveInfoToFireStore (String id) async {
  SharedPreferences? sharedPreferences = await  SharedPreferences.getInstance();
  await firebaseFirestore.collection("Admins").doc(id).set({
    "publishedDate" : DateTime.now().millisecondsSinceEpoch,
    "dateOfCreateAccount" : DateTime.now().toString(),
    "AdminUID" : id ,
     "AdminEmail" : SignUpScreen2.emailController.text.trim(),
    "AdminName" : SignUpScreen2.nameController.text,
    "AdminImage" : SignUpScreen.imageDownloadUrl,
    "AdminPhoneNumber" : SignUpScreen.phoneNumber,
    "status" : "approved",
    "AdminStatus" : "on",
    "AdminPassword" : SignUpScreen2.passController.text,
  });
  await sharedPreferences.setString("uid", id);
  await sharedPreferences.setString("name", SignUpScreen2.nameController.text);
  await sharedPreferences.setString("email", SignUpScreen2.emailController.text.trim());
  await sharedPreferences.setString("image", SignUpScreen.imageDownloadUrl!);
}
}
class SwitchBloc extends Bloc<dynamic, String> {
  final _switchController = StreamController<String>.broadcast();

  SwitchBloc() : super("on");
  Stream<String> get switchStream => _switchController.stream;

  void updateSwitchValue ( String newValue){
    _switchController.add(newValue);
  }
  void dispose (){
    _switchController.close();
  }
}