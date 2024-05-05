import 'dart:async';

import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/profile_editing_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_appBar.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/SharedPreferencesModel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
SharedPreferences? sharedPreferences = SharedPreferencesService().sharedPreferences;
class _ProfileScreenState extends State<ProfileScreen> {
  Color? containerColor;

  @override
  Widget build(BuildContext context) {
    ScreenSize.size(context);
    bool isOn = false;
    return Scaffold(
      appBar: CustomAppBar(
        isOn: isOn,
        pageName: "Profile",
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: customDrawer(context),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.grey,
            Colors.blueAccent,
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Column(
          children: [
            SizedBox(height: ScreenSize.height! * 0.030),
            CircleAvatar(
              minRadius: 70.0,
              backgroundImage: NetworkImage(
                  sharedPreferences!.getString("image").toString()),
            ),
            SizedBox(height: ScreenSize.height! * 0.015),
            Text(
              sharedPreferences!.getString("name").toString(),
              style: GoogleFonts.abel(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Text(sharedPreferences!.getString("email").toString(),
                style: GoogleFonts.abel(
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold))),
            SizedBox(height: ScreenSize.height! * 0.015),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageTransition(
                      child: const ProfileEditingScreen(),
                      type: PageTransitionType.fade));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, elevation: 0.3),
                child: Text("Edit Profile", style: GoogleFonts.acme())),
            SizedBox(height: ScreenSize.height! * 0.015),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenSize.width! * 0.2),
              child: ListTile(
                onTap: () {
                  debugPrint("askour");
                },
                leading: const Icon(
                  Icons.home,
                  color: Colors.yellow,
                ),
                title: Text("Home", style: GoogleFonts.acme()),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenSize.width! * 0.2),
              child: ListTile(
                onTap: () {
                  debugPrint("askour");
                },
                leading: const Icon(
                  Icons.settings,
                  color: Colors.yellow,
                ),
                title: Text("Settings", style: GoogleFonts.acme()),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenSize.width! * 0.2),
              child: ListTile(
                onTap: () {
                  debugPrint("askour");
                },
                leading: const Icon(
                  Icons.document_scanner,
                  color: Colors.yellow,
                ),
                title: Text("Report", style: GoogleFonts.acme()),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            SizedBox(height: ScreenSize.height! * 0.2),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenSize.width! * 0.2),
              child: Container(
                decoration: BoxDecoration(
                    color: containerColor ?? Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: ListTile(
                  onTap: () {
                    debugPrint("askour");
                    setState(() {
                      containerColor = Colors.red;
                    });
                    Future.delayed(const Duration(microseconds: 10), () {
                      setState(() {
                        containerColor = Colors.grey;
                      });
                    });
                  },
                  leading: const Icon(Icons.logout, color: Colors.yellow),
                  title: Text("SignOut",
                      style: GoogleFonts.acme(
                          textStyle: TextStyle(
                              color: containerColor == Colors.grey
                                  ? Colors.red
                                  : Colors.white))),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: containerColor == Colors.grey
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
