import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/auth_screens/login_screen.dart';
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
  late Timer _myTimer;
  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult =  connectivityResult;
    });
  }

  startTimer() async {
    _myTimer = Timer(const Duration(seconds: 5), () async {
      auth.authStateChanges().listen((User? Admin) {
        if (Admin != null && Admin.emailVerified) {
          if (mounted){
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
          }
        } else if (Admin == null || !Admin.emailVerified) {
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
  void dispose() {
   _myTimer.cancel();
    super.dispose();
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
                  "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/TAQAUNIVERSLOGO.png",
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
