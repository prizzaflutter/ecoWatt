import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:flutter/material.dart';
class UserDesignWidget extends StatefulWidget {
  final UserModel? userModel;
  final BuildContext context ;
  const UserDesignWidget({super.key, this.userModel, required this.context});

  @override
  State<UserDesignWidget> createState() => _UserDesignWidgetState();
}

class _UserDesignWidgetState extends State<UserDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         if( widget.userModel!.userStatus == "on"){

         }
      },
    );
  }
}
