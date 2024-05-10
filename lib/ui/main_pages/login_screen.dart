import 'package:ecowatt_yassine_askour_flutter/bloc/admin_bloc.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/global.dart';
import '../../widgets/email_password_validator.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  static BuildContext? savedContext ;
  const LoginScreen({super.key});


  // get the data and set to locally
  static Future<void> getDataAndSetLocally(String id) async {
    if (savedContext != null){
      await firebaseFirestore
          .collection("Admins")
          .doc(id)
          .get()
          .then((snapshot) async {
        if (snapshot.exists) {
          SharedPreferences? sharedPreferences =  await SharedPreferences.getInstance();
          if (snapshot.data()!["status"] == "approved") {
            await sharedPreferences.setString("uid", id);
            await sharedPreferences.setString("name", snapshot.data()!["AdminName"]);
            await sharedPreferences.setString(
                "email", snapshot.data()!["AdminEmail"]);
            await sharedPreferences.setInt(
                "publishedDate", snapshot.data()!["publishedDate"]);
            await sharedPreferences.setString(
                "dateOfCreateAccount", snapshot.data()!["dateOfCreateAccount"].toString());
            await sharedPreferences.setString(
                "password", snapshot.data()!["AdminPassword"]);
            await sharedPreferences.setString(
                "image", snapshot.data()!["AdminImage"]);
            await sharedPreferences.setString(
                "phoneNumber", snapshot.data()!["AdminPhoneNumber"]);
            await sharedPreferences.setString(
                "AdminStatus", snapshot.data()!["AdminStatus"]);
            await sharedPreferences.setString(
                "status", snapshot.data()!["status"]);
            Navigator.pop(savedContext!);
            // Navigator.of(savedContext!).push(
            //   PageTransition(
            //     child: const HomeScreen(),
            //     type: PageTransitionType.rightToLeft,
            //     duration: const Duration(milliseconds: 300),
            //     reverseDuration: const Duration(milliseconds: 300),
            //   ),
            // );
          } else {
            Navigator.pop(savedContext!);
            debugPrint("You account has been blocked");
            ScaffoldMessenger.of(savedContext!).showSnackBar(
                const SnackBar(content: Text("You account has been blocked")));
          }
        } else {
          debugPrint("Snapshot doesn't exist");
          auth.signOut();
          Navigator.pop(savedContext!);
          Navigator.of(savedContext!).push(
            PageTransition(
              child: const LoginScreen(),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 300),
              reverseDuration: const Duration(milliseconds: 300),
            ),
          );
          showDialog(
              context: savedContext!,
              builder: (context) {
                return const  Dialog(
                  child: Text("Error From Dialog"),
                );
              });
        }
      });
    }else {
      debugPrint("context not available");
      throw Exception("context not available");
    }
  }
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  // Future<bool> isPhoneNumberRegistered(String phoneNumber) async {
  //   try {
  //     ConfirmationResult  confirmationResult =  await  auth.signInWithPhoneNumber(phoneNumber);
  //     return confirmationResult == true ;
  //   }catch(ex){}
  // }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      LoginScreen.savedContext = context;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Image.asset(
                "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattLogobg.png",
                width: 413,
                height: 457,
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Form(
                key: _globalKey,
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Log In",
                      style: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 27.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      validator: (email) => validateEmail(email!),
                      controller: _emailcontroller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        if (value.endsWith("com")) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: const TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color(0xFF755DC1),
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                            BorderSide(width: 1, color: Color(0xFF9F7BFF)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xFF837E93)))),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      validator: (password) => validatePassword(password!),
                      controller: _passwordcontroller,
                      textAlign: TextAlign.center,
                      obscuringCharacter: "*",
                      obscureText: true,
                      style: const TextStyle(
                        color: Color(0xFF393939),
                        fontSize: 15,
                        fontFamily: 'Pippins',
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide:
                            BorderSide(width: 1, color: Color(0xFF847E93))),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide:
                          BorderSide(width: 1, color: Color(0xFF837E93)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // BlocConsumer<ResetPasswordBloc, AuthState>(
                    //   listener: (context, state) {
                    //     if (state is AuthSuccessState) {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         const SnackBar(
                    //           content: Text(
                    //               "Password reset email sent. Check your inbox."),
                    //         ),
                    //       );
                    //     } else if (state is AuthFailureState) {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         const SnackBar(
                    //           content: Text(
                    //               "Failed to reset you password. Try again. "),
                    //         ),
                    //       );
                    //     }
                    //   },
                    //   builder: (context, state) {
                    //     return InkWell(
                    //       onTap: () async {
                    //         BlocProvider.of<ResetPasswordBloc>(context).add(
                    //           ResetPasswordEvent(
                    //             email: _emailcontroller.text.trim(),
                    //           ),
                    //         );
                    //       },
                    //       child: Text(
                    //         state is AuthLoadingState
                    //             ? "............."
                    //             : 'Forget Password',
                    //         style: const TextStyle(
                    //             color: Color(0xFF755DC1),
                    //             fontSize: 13,
                    //             fontFamily: 'Poppins',
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     );
                    //   },
                    // ),
                    // const SizedBox(
                    //   height: 15.0,
                    // ),
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                      child: SizedBox(
                        width: 329,
                        height: 56,
                        child: BlocConsumer<LogInBloc, AdminState>(
                          listener: (context, state) async {
                            if (state is DataLoadedState) {
                              auth
                                  .authStateChanges()
                                  .listen((User? Admin) async {
                                if (Admin != null) {
                                  debugPrint("-------------------------The Admin != null ------------------------------------------------------------");
                                  if (Admin.emailVerified  == true ) {
                                    debugPrint(
                                        "-----------------: ${Admin.emailVerified.toString()}");
                                    Navigator.of(context).push(
                                      PageTransition(
                                        child: const HomeScreen(),
                                        type: PageTransitionType.rightToLeft,
                                        duration:
                                        const Duration(milliseconds: 300),
                                        reverseDuration:
                                        const Duration(milliseconds: 300),
                                      ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Welcome...."),
                                      ),
                                    );
                                  } else {
                                    debugPrint("...............false");
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "check your email box : Verify your email and try again")));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("the Admin == null")));
                                }
                              });
                            } else if (state is DataLoadingErrorSate) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Email Or Password Incorrect"),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () async {
                                if (_globalKey.currentState!.validate()) {
                                  BlocProvider.of<LogInBloc>(context).add(
                                    LogInAdminEvent(
                                      email: _emailcontroller.text.trim(),
                                      password: _passwordcontroller.text.trim(),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9F7BFF),
                              ),
                              child: Text(
                                state is DataLoadingState
                                    ? "......."
                                    : 'Sign In',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Color(0xFF837E93),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(
                          width: 2.5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const SignUpScreen(),
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 300),
                                reverseDuration:
                                const Duration(milliseconds: 300),
                              ),
                            );
                            // FocusManager.instance.primaryFocus?.unfocus();
                            // widget.controller.animateToPage(0,
                            //     duration: const Duration(milliseconds: 500),
                            //     curve: Curves.ease);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color(0xFF755DC1),
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

