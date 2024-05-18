import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/custom_widgets/custom_cached_network_image.dart';
class FriendProfileScreen extends StatefulWidget {
  final UserModel userModel;
  const FriendProfileScreen({super.key,required this.userModel});

  @override
  State<FriendProfileScreen> createState() => _FriendProfileScreenState();
}

class _FriendProfileScreenState extends State<FriendProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.size(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Hero(
            tag: "profile",
            child: cachedNetworkImage(image: widget.userModel.userImage!,width: 140, height: 140),
          ),
          Text(widget.userModel.userName.toString(),style :GoogleFonts.acme(textStyle:const TextStyle(fontSize: 20))),
          Text(widget.userModel.userPhoneNumber.toString(),style :GoogleFonts.acme(textStyle:const TextStyle(fontSize: 20))),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/icon/phone.png",width: 40,height: 40,),
              SizedBox(width: ScreenSize.width! * 0.5),
              Image.asset("C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/icon/chat.png", width: 40,height:40,),
            ],
          )

        ],
      ),
    );
  }
}
