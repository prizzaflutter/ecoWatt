import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:flutter/material.dart';

class UserReportDesignWidget extends StatefulWidget {
  final UserModel? userModel;
  final BuildContext? context;

  const UserReportDesignWidget({
    super.key,
    this.context,
    this.userModel,
  });

  @override
  State<UserReportDesignWidget> createState() => _UserReportDesignWidgetState();
}

class _UserReportDesignWidgetState extends State<UserReportDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (widget.userModel!.userStatus == "on") {
        //   // Navigator.of(context).push(PageTransition(
        //   //     child: MenuScreen(
        //   //       sellersModel: widget.sellersModel,
        //   //     ),
        //   //     type: PageTransitionType.rightToLeft));
        // }
        // if (widget.userModel!.userStatus == "off") {
        //   Fluttertoast.showToast(msg: "Restaurant is off");
        // }
      },
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              minRadius: 40,
              backgroundImage:
                  NetworkImage(widget.userModel!.userImage.toString()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.userModel!.userName.toString()),
                      Text(widget.userModel!.userEmail.toString()),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
