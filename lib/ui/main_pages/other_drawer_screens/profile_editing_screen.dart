import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecowatt_yassine_askour_flutter/model/SharedPreferencesModel.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_widgets/custom_cached_network_image.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../global/global.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({super.key});

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

SharedPreferences? sharedPreferences =
    SharedPreferencesService().sharedPreferences;
TextEditingController emailController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController numberController = TextEditingController();

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Edit Profile",
            style: GoogleFonts.acme(
                textStyle: const TextStyle(color: Colors.white))),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              cachedNetworkImage(image: image, width: 140, height: 140),
              SizedBox(height: ScreenSize.height! * 0.015),
              CustomTextField(
                borderRadius: BorderRadius.circular(30),
                controller: nameController,
                hintsText: name,
                maxLines: 1,
                prefixIcon: const Icon(Icons.person),
              ),
              SizedBox(height: ScreenSize.height! * 0.015),
              CustomTextField(
                borderRadius: BorderRadius.circular(30),
                controller: numberController,
                hintsText: sharedPreferences!.getString("phoneNumber").toString(),
                maxLines: 1,
                prefixIcon: const Icon(Icons.phone),
              ),
              SizedBox(height: ScreenSize.height! * 0.015),
              CustomTextField(
                borderRadius: BorderRadius.circular(30),
                controller: emailController,
                hintsText: email,
                maxLines: 1,
                prefixIcon: const Icon(Icons.email),
              ),
              SizedBox(height: ScreenSize.height! * 0.015),
              CustomTextField(
                  borderRadius: BorderRadius.circular(30),
                  controller: passwordController,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  hintsText:password,
                  maxLines: 1,
                  prefixIcon: const Icon(Icons.password)),
              SizedBox(height: ScreenSize.height! * 0.09),
              SizedBox(
                width: ScreenSize.width! * 0.80,
                height: ScreenSize.height! * 0.06,
                child: ElevatedButton(
                    onPressed: () {
                      debugPrint(Timestamp.now().toString());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                    child: const Text("Edit Profile")),
              ),
              SizedBox(height: ScreenSize.height! * 0.09),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    dateOfCreateAccount,
                    style: GoogleFonts.acme(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Delete Account",
                      style: GoogleFonts.acme(
                        textStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
