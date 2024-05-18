import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  Widget? pageName;
  Widget action;
  bool showSwitch;
  bool isOn;

  Widget? leading;
  bool? automaticallyImplyLeading;

  CustomAppBar(
      {super.key,
      required this.isOn,
      this.pageName,
      this.leading,
      required this.action,
      this.automaticallyImplyLeading,
      required this.showSwitch});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading ?? false,
      leading: widget.leading,
      backgroundColor: Colors.transparent,
      title: Center(
          child: widget.pageName != null
              ? widget.pageName
              : Image.asset(
                  "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/TAQAUNIVERSLOGO.png",
                  width: width * 0.30,
                )),
      actions: [
        widget.showSwitch
            ? Switch(
                value: widget.isOn,
                onChanged: (value) {
                  debugPrint(value.toString());
                  setState(() {
                    widget.isOn = value;
                    debugPrint(widget.isOn.toString());
                  });
                })
            : widget.action,
      ],
    );
  }
}
