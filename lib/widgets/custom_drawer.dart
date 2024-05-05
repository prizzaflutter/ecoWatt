import "package:ecowatt_yassine_askour_flutter/model/SharedPreferencesModel.dart";
import "package:ecowatt_yassine_askour_flutter/ui/main_pages/home_page.dart";
import"package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:page_transition/page_transition.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../global/global.dart";
import "../ui/main_pages/login_screen.dart";
import "../ui/main_pages/profile_screen.dart";
import "../ui/main_pages/report_screen.dart";
import "../ui/main_pages/settings_screen.dart";
Widget customDrawer (BuildContext context){
  SharedPreferences? sharedPreferences = SharedPreferencesService().sharedPreferences;
  final double height = MediaQuery.of(context).size.height;
  final double width = MediaQuery.of(context).size.width;
  return  Container(
    color: Colors.grey.shade100,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: height * 0.050),
      CircleAvatar(
        minRadius: 70.0,
        backgroundImage: NetworkImage(
            sharedPreferences!.getString("image").toString()),
      ),
      SizedBox(
        height: height * 0.015,
      ),
      Center(
          child: Text(
            sharedPreferences.getString("name").toString(),
            style: GoogleFonts.abel(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent)),
          )),
      SizedBox(height: height * 0.070),
      const Divider(),
      SizedBox(
        width: ScreenSize.width,
        child: ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context);
              Navigator.of(context).push(PageTransition(child: const HomeScreen(), type: PageTransitionType.rightToLeft));
            },
            icon: const Icon(Icons.home),
            label: const Text("      Home"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
                alignment: Alignment.centerLeft,
                backgroundColor: Colors.white, elevation: 0)),
      ),
      SizedBox(
        width: ScreenSize.width,
        child: ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context);
              Navigator.of(context).push(PageTransition(child: const ProfileScreen(), type: PageTransitionType.rightToLeft));
            },
            icon: const Icon(Icons.person),
            label: const Text("      Profile"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
                alignment: Alignment.centerLeft,
                backgroundColor: Colors.white, elevation: 0)),
      ),
      SizedBox(
        width: ScreenSize.width,
        child: ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context);
              Navigator.of(context).push(PageTransition(child: const SettingsScreen(), type: PageTransitionType.rightToLeft));
            },
            icon: const Icon(Icons.settings),
            label: const Text("      Settings"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
                backgroundColor: Colors.white, elevation: 0,
              alignment: Alignment.centerLeft
            )),
      ),
      SizedBox(
        width: ScreenSize.width,
        child: ElevatedButton.icon(
          label: const Text("Create a Report"),
          onPressed: () async {
            Navigator.pop(context);
            Navigator.of(context).push(PageTransition(child: const NewReportScreen(), type: PageTransitionType.rightToLeft));
          },
          icon: const Icon(Icons.document_scanner_sharp),
          style: ElevatedButton.styleFrom(foregroundColor: Colors.black, elevation: 0, alignment: Alignment.centerLeft,backgroundColor: Colors.white),
        ),
      ),
      SizedBox(
        width: ScreenSize.width,
        child: ElevatedButton.icon(
          label: const Text("     SignOut"),
          onPressed: () async {
            await auth.signOut().then((user) {
              Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                      child: const LoginScreen(),
                      type: PageTransitionType.fade),
                      (route) => false);
            });
          },
          icon: const Icon(Icons.logout),
          style: ElevatedButton.styleFrom(foregroundColor: Colors.black, alignment: Alignment.centerLeft,elevation: 0,backgroundColor: Colors.white),
        ),
      ),
      SizedBox(
        height: ScreenSize.height! * 0.3,
      ),
      SizedBox(
        width: ScreenSize.width,
        child: ElevatedButton.icon(
          label: const Text("     About Us"),
          onPressed: () async {
            await auth.signOut().then((user) {
              Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                      child: const LoginScreen(),
                      type: PageTransitionType.fade),
                      (route) => false);
            });
          },
          icon: const Icon(Icons.sentiment_satisfied_alt_rounded),
          style: ElevatedButton.styleFrom(foregroundColor: Colors.black, alignment: Alignment.centerLeft,elevation: 0,backgroundColor: Colors.white),
        ),
      ),
    ]),
  ) ;
}