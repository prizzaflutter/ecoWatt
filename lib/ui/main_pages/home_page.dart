import 'dart:math';

import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/advanced_drawer_widget.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOn = false;
  List<Widget> widgets = [
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(30)),
                  child: Container(
                    color: Colors.red,
                    child: Image.asset(
                        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner2.jpeg",
                        fit: BoxFit.cover),
                  ),
                ),
                const Text("askour")
              ],
            ),
          ),
        )
        // child: Stack(
        //   children: [
        //     ClipRRect(
        //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
        //       child: Container(
        //         color: Colors.red,
        //         child:  Image.asset(
        //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
        //             fit: BoxFit.cover),
        //       ),
        //     ),
        //   ],
        // )
        ),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(30)),
                  child: Container(
                    color: Colors.red,
                    child: Image.asset(
                        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner2.jpeg",
                        fit: BoxFit.cover),
                  ),
                ),
                const Text("askour")
              ],
            ),
          ),
        )
        // child: Stack(
        //   children: [
        //     ClipRRect(
        //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
        //       child: Container(
        //         color: Colors.red,
        //         child:  Image.asset(
        //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
        //             fit: BoxFit.cover),
        //       ),
        //     ),
        //   ],
        // )
        ),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(30)),
                  child: Container(
                    color: Colors.red,
                    child: Image.asset(
                        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner2.jpeg",
                        fit: BoxFit.cover),
                  ),
                ),
                const Text("askour")
              ],
            ),
          ),
        )
        ),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(30)),
                  child: Container(
                    color: Colors.red,
                    child: Image.asset(
                        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner2.jpeg",
                        fit: BoxFit.cover),
                  ),
                ),
                const Text("askour")
              ],
            ),
          ),
        )
        ),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(30)),
                  child: Container(
                    color: Colors.red,
                    child: Image.asset(
                        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner2.jpeg",
                        fit: BoxFit.cover),
                  ),
                ),
                const Text("askour")
              ],
            ),
          ),
        )
        ),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(30)),
                  child: Container(
                    color: Colors.red,
                    child: Image.asset(
                        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner2.jpeg",
                        fit: BoxFit.cover),
                  ),
                ),
                const Text("askour")
              ],
            ),
          ),
        )
        ),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(30)),
                  child: Container(
                    color: Colors.red,
                    child: Image.asset(
                        "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner2.jpeg",
                        fit: BoxFit.cover),
                  ),
                ),
                const Text("askour")
              ],
            ),
          ),
        )
        // child: Stack(
        //   children: [
        //     ClipRRect(
        //       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(30)),
        //       child: Container(
        //         color: Colors.red,
        //         child:  Image.asset(
        //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter/lib/images/ecoWattBanner2.jpeg",
        //             fit: BoxFit.cover),
        //       ),
        //     ),
        //   ],
        // )
        ),
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
                Row(
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
                              Text(
                                 name ,
                                  style: GoogleFonts.acme()),
                              Text(
                                  email,
                                  style: GoogleFonts.acme()),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined),
                        ],
                      ),
                    ),
                  ],
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                      child: SizedBox(
                    width: ScreenSize.width! * 2,
                    height: min(ScreenSize.width! / 2.5 * 1.4,
                        ScreenSize.height! * 0.7),
                    child: OverlappedCarousel(
                      widgets: widgets,
                      currentIndex: widgets.length ~/ 2,
                      onClicked: (index) {
                        debugPrint(index.toString());
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("You Clicked at $index")));
                      },
                      obscure: 0.2,
                      skewAngle: 0,
                    ),
                  )),
                ),
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
        ));
  }
}
