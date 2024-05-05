import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../global/global.dart';
import 'home_page.dart';
import 'no_connection_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static bool isLogin = false;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<ConnectivityResult>? _connectivityResult;

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult =  connectivityResult;
    });
  }

  startTimer() async {
    Timer(const Duration(seconds: 5), () async {
      auth.authStateChanges().listen((User? user) {
        if (user != null && user.emailVerified) {
          setState(() {
            SplashScreen.isLogin = true;
            if (_connectivityResult == ConnectivityResult.none){
              Navigator.of(context).pushReplacement(
                PageTransition(child: const NoConnectionScreen(), type: PageTransitionType.rightToLeft),
              );
            }else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }
          });
        } else if (user == null || !user.emailVerified) {
          setState(() {
            SplashScreen.isLogin = false;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          });
        }
      });
    });
  }


  @override
  void initState() {
    checkConnectivity();
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattLogobg.png",
                width: MediaQuery.of(context).size.width * 0.30,
              ),
              const CircularProgressIndicator(color: Colors.red,),
            ],
          ),
        )
      ),
    );
  }
}
