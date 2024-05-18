import 'package:card_swiper/card_swiper.dart';
import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/other_drawer_screens/profile_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_widgets/custom_advanced_drawer_widget.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_widgets/custom_cached_network_image.dart';
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
  // TODO Variables => here
  bool isOn = false;
  // TODO  List of our teams
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
  ];
  // TODO  advancedDrawer  Controller
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    ScreenSize.size(context);
    return advancedDrawerWidget(
      showSwitch: true,
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
              // todo : on Tap on the List tile navigate to profile screen
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ProfileScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      transitionDuration: const Duration(milliseconds: 600),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 600),
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
              // todo : our team
              Container(
                height: ScreenSize.height! * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Swiper(
                    itemHeight: ScreenSize.height! * 0.3,
                    itemWidth: 300.0,
                    layout: SwiperLayout.STACK,
                    scrollDirection: Axis.horizontal,
                    pagination: SwiperPagination(),
                    itemCount: widgets.length,
                    itemBuilder: (context, index) {
                      return widgets[index];
                    },
                  ),
                ),
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
              // todo : all projects

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
