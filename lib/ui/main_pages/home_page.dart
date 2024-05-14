import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/login_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/profile_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/advanced_drawer_widget.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOn = false;
  List<Widget> widgets = [
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/AYOUB_BENBAHA.png",
        fit: BoxFit.fill),
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/AZIZ_EL_GOUARIR.png",
        fit: BoxFit.cover),
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/HAMID_BOULASSAIR.png",
        fit: BoxFit.cover),
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/HASSAN_CHELIH.png",
        fit: BoxFit.cover),
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/JASSIM_CHAFAI.png",
        fit: BoxFit.cover),
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/M.AMINE_BOURAS.png",
        fit: BoxFit.cover),
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/MBAREK_MAAYOUF.png",
        fit: BoxFit.cover),
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/MOHAMED_EL_FIRAR.png",
        fit: BoxFit.cover),
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/MOHAMED_LAHMIDI.png",
        fit: BoxFit.cover),
    Image.asset(
        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/WALID_TELBANI.png",
        fit: BoxFit.cover),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: Container(
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           ClipRRect(
    //             borderRadius: const BorderRadius.only(
    //                 bottomRight: Radius.circular(20),
    //                 bottomLeft: Radius.circular(30)),
    //             child: Container(
    //               color: Colors.red,
    //               child: Image.asset(
    //                   "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/AYOUB_BENBAHA.png",
    //                   fit: BoxFit.cover),
    //             ),
    //           ),
    //           const Text("Ayoub benbaha")
    //         ],
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/AYOUB_BENBAHA.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("Ayoub benbaha")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/AYOUB_BENBAHA.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("Ayoub benbaha")
    //           ],
    //         ),
    //       ),
    //     )
    //     // child: Stack(
    //     //   children: [
    //     //     ClipRRect(
    //     //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //     //       child: Container(
    //     //         color: Colors.red,
    //     //         child:  Image.asset(
    //     //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //     //             fit: BoxFit.cover),
    //     //       ),
    //     //     ),
    //     //   ],
    //     // )
    //     ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/AZIZ_EL_GOUARIR.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("AZIZ ELGOUARIR")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/HAMID_BOULASSAIR.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("HAMID BOULASSAIR")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/HASSAN_CHELIH.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("HASSANCHELIH.png")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/JASSIM_CHAFAI.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("JASSIM CHAFAI")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/M.AMINE_BOURAS.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("M.AMINE BOURAS")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/MBAREK_MAAYOUF.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("MBAREK MAAYOUF")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/MOHAMED_EL_FIRAR.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("MOHAMED ELFIRAR")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/MOHAMED_LAHMIDI.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("MOHAMED LAHMIDI")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/WALID_TELBANI.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("WALID TELBANI")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/WALID_TELBANI.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("WALID TELBANI")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: Colors.black45,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(20),
    //                   bottomLeft: Radius.circular(30)),
    //               child: Container(
    //                 color: Colors.red,
    //                 child: Image.asset(
    //                     "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/image/WALID_TELBANI.png",
    //                     fit: BoxFit.cover),
    //               ),
    //             ),
    //             const Text("WALID TELBANI")
    //           ],
    //         ),
    //       ),
    //     )
    //   // child: Stack(
    //   //   children: [
    //   //     ClipRRect(
    //   //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
    //   //       child: Container(
    //   //         color: Colors.red,
    //   //         child:  Image.asset(
    //   //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
    //   //             fit: BoxFit.cover),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // )
    // ),


  ];
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.size(context);
    return advancedDrawerWidget(
      showSwitch: true ,
      action: Text(""),
      isAppBar: true,
      context: context,
      controller: _advancedDrawerController,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlideshow(
                indicatorPadding: 20,
                isLoop: true,
                autoPlayInterval: 5000,
                indicatorColor: Colors.red,
                indicatorRadius: 8.0,
                height: ScreenSize.height! * 0.3,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(
                      "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner.jpeg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(
                        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner1.jpeg",
                        fit: BoxFit.cover),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(
                        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner2.jpeg",
                        fit: BoxFit.cover),
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.height! * 0.015),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                      const ProfileScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        // const begin = Offset(1.0, 0.0);
                        // const end = Offset.zero;
                        // const curve = Curves.easeInOut;
                        // var tween = Tween(begin: begin, end: end)
                        //     .chain(CurveTween(curve: curve));
                        // var offsetAnimation = animation.drive(tween);
                        return FadeTransition(
                            opacity: animation, child: child);
                      },
                      transitionDuration: const Duration(milliseconds: 600),
                      reverseTransitionDuration: const Duration(milliseconds: 600),
                    ),
                  );
                },
                child: Row(
                  children: [
                    cachedNetworkImage(image: image, width: 80, height: 80),
                    SizedBox(
                      width: ScreenSize.width! * 0.019,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name, style: GoogleFonts.acme()),
                              Text(email, style: GoogleFonts.acme()),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenSize.height! * 0.015),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Our Team",
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  )),
              Container(
                height: ScreenSize.height! * 0.3,
                child: ClipRRect(borderRadius: BorderRadius.circular(30),
                  child: Swiper(
                    itemHeight: ScreenSize.height! * 0.3,
                    itemWidth: 300.0,
                    layout: SwiperLayout.STACK,
                    scrollDirection: Axis.horizontal,
                    pagination: SwiperPagination(),
                    itemCount: widgets.length,
                    itemBuilder: (context , index){
                      return widgets[index];
                    },
                  ),
                ),
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Center(
              //       child: SizedBox(
              //     width: ScreenSize.width! * 3,
              //     height: min(
              //         ScreenSize.width! / 2.5 * 1.4, ScreenSize.height! * 0.9),
              //     child: OverlappedCarousel(
              //       widgets: widgets,
              //       currentIndex: widgets.length ~/ 2,
              //       onClicked: (index) {
              //         debugPrint(index.toString());
              //         ScaffoldMessenger.of(context).showSnackBar(
              //             SnackBar(content: Text("You Clicked at $index")));
              //       },
              //       obscure: 0.2,
              //     ),
              //   )),
              // ),
              SizedBox(height: ScreenSize.height! * 0.015),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All Projects",
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  )),

              // SliverGrid.builder(
              //   gridDelegate:
              //   const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       childAspectRatio:
              //       0.74),
              //   itemBuilder: (context ,index){},)
            ],
          ),
        ),
      ),
    );
  }
}
