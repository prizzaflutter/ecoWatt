import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecowatt_yassine_askour_flutter/model/SharedPreferencesModel.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/global.dart';

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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
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
              CircleAvatar(
                backgroundImage: NetworkImage(
                    sharedPreferences!.getString("image").toString()),
                minRadius: 70,
                child: const Icon(Icons.add_a_photo_outlined),
              ),
              SizedBox(height: ScreenSize.height! * 0.015),
              CustomTextField(
                borderRadius: BorderRadius.circular(30),
                controller: nameController,
                hintsText: sharedPreferences!.getString("name").toString(),
                maxLines: 1,
                prefixIcon: const Icon(Icons.person),
              ),
              SizedBox(height: ScreenSize.height! * 0.015),
              CustomTextField(
                borderRadius: BorderRadius.circular(30),
                controller: numberController,
                hintsText:
                    sharedPreferences!.getString("phoneNumber").toString(),
                maxLines: 1,
                prefixIcon: const Icon(Icons.phone),
              ),
              SizedBox(height: ScreenSize.height! * 0.015),
              CustomTextField(
                borderRadius: BorderRadius.circular(30),
                controller: emailController,
                hintsText: sharedPreferences!.getString("email"),
                maxLines: 1,
                prefixIcon: const Icon(Icons.email),
              ),
              SizedBox(height: ScreenSize.height! * 0.015),
              CustomTextField(
                  borderRadius: BorderRadius.circular(30),
                  controller: passwordController,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  hintsText:
                      sharedPreferences!.getString("password").toString(),
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
                  Text(sharedPreferences!.getString("dateOfCreateAccount")!, style: GoogleFonts.acme(),),
                  TextButton(
                      onPressed: () {},
                      child: Text("Delete Account",
                          style: GoogleFonts.acme(
                              textStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                              ))))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
