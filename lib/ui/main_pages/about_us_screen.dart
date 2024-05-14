import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/advanced_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global/global.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.size(context);
    return advancedDrawerWidget(
      showSwitch: true,
        action: Text(""),
        isAppBar: false,
        context: context,
        controller: _advancedDrawerController,
        body: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                            "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/Dyassine.png"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "YASSINE ALJ",
                          style: GoogleFonts.acme(
                              textStyle: const TextStyle(fontSize: 20)),
                        ),
                        Text("Directeur Development",
                            style: GoogleFonts.aBeeZee())
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                            "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/yassine.png"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "YASSINE INDJARNE",
                          style: GoogleFonts.acme(
                              textStyle: const TextStyle(fontSize: 20)),
                        ),
                        Text("Office manager", style: GoogleFonts.aBeeZee()),
                        Text("The owner of the idea",
                            style: GoogleFonts.aBeeZee())
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                            "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/Askour1.jpg"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "IDRISS ASKOUR            ",
                          style: GoogleFonts.acme(
                              textStyle: const TextStyle(fontSize: 20)),
                        ),
                        Text("flutter developer", style: GoogleFonts.aBeeZee())
                      ],
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "    About us",
                  style: GoogleFonts.acme(
                    textStyle: const TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(8.0),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: ScreenSize.width! * 0.1,
                      height: ScreenSize.height! * 0.36,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                      "TAQAUNIVERS",textStyle: const TextStyle(fontSize: 30,),),
                                ],
                              ),
                              AnimatedTextKit(
                                totalRepeatCount: 2,
                                animatedTexts: [
                          
                                  TypewriterAnimatedText(
                                      "       presents itself as a Moroccan company expert "
                                          "in the fields of industrial electricity and solar energy,"
                                          " having its headquarters in Agadir and extending its scope "
                                          "to several cities and regions of the Kingdom, notably Agadir, "
                                          "Marrakech, Beni Mellal , Rabat, Meknes, Fez, Oujda and Er-Rachidia."
                                          "The range of services offered by TAQAUNIVERS is aimed at a diverse "
                                          "clientele operating in various sectors, including businesses and industries,"
                                          " agricultural operations, communities and private collective buildings, as well"
                                          " as social and hospital establishments. With a reach also extended to academic "
                                          "establishments, TAQAUNIVERS positions itself as a complete service provider, meeting "
                                          "the energy needs of individuals and professional entities with extensive expertise and a "
                                          "commitment to quality."),
                                ],
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              )
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ImageSlideshow(
              //     disableUserScrolling: false,
              //     indicatorPadding: 20,
              //     autoPlayInterval: 5000,
              //     indicatorColor: Colors.red,
              //     indicatorRadius: 8.0,
              //     height: ScreenSize.height! * 0.3,
              //     children: [
              //       ClipRRect(
              //         borderRadius: const BorderRadius.all(Radius.circular(30)),
              //         child: Text("TAQAUNIVERS presents itself as a Moroccan company expert in the fields of industrial electricity and solar energy, having its headquarters in Agadir and extending its scope to several cities and regions of the Kingdom, notably Agadir, Marrakech, Beni Mellal , Rabat, Meknes, Fez, Oujda and Er-Rachidia.", style : GoogleFonts.aBeeZee()),
              //       ),
              //       ClipRRect(
              //         borderRadius: const BorderRadius.all(Radius.circular(30)),
              //         child: Image.asset(
              //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner1.jpeg",
              //             fit: BoxFit.cover),
              //       ),
              //       ClipRRect(
              //         borderRadius: const BorderRadius.all(Radius.circular(30)),
              //         child: Image.asset(
              //             "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattBanner2.jpeg",
              //             fit: BoxFit.cover),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ));
  }
}
