import 'dart:async';
import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/profile_editing_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_appBar.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../widgets/cached_network_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  Color? containerColor;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.size(context);
    return AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
            ),
          ),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: customDrawer(context),
        child: Scaffold(
          appBar: CustomAppBar(
            pageName: Text("Profile"),
            showSwitch: true,
            action: Icon(Icons.search),
            isOn: true,
            leading: IconButton(
              onPressed: ()=> handleMenuButtonPressed(_advancedDrawerController),
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      key: ValueKey<bool>(value.visible),
                      child: Icon(value.visible ? Icons.clear : Icons.menu));
                },
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                color: Colors.white
              // gradient: LinearGradient(colors: [
              //   Colors.grey,
              //   Colors.blueAccent,
              // ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
            child: Column(
              children: [
                SizedBox(height: ScreenSize.height! * 0.030),
                cachedNetworkImage(
                  image: image,
                ),
                SizedBox(height: ScreenSize.height! * 0.015),
                Text(
                  name,
                  style: GoogleFonts.abel(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Text(
                email,
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
        ));
  }

}
