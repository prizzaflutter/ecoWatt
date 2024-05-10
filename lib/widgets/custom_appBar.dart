import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
      String? pageName ;
      bool isOn ;
      Widget? leading;
     CustomAppBar({super.key, required this.isOn, this.pageName,this.leading});

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
      leading: widget.leading ,
      backgroundColor: Colors.transparent,
      title: Center(
          child: widget.pageName != null ? Text(widget.pageName.toString()) : Image.asset(
            "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/ecoWattLogobg.png",
            width: width * 0.30,
          )),
      actions: [
        Switch(
            value: widget.isOn,
            onChanged: (value) {
              debugPrint(value.toString());
              setState(() {
                widget.isOn = value;
                debugPrint(widget.isOn.toString());
              });
            })
      ],
    );
  }
}

