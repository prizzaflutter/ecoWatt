import 'package:ecowatt_yassine_askour_flutter/widgets/custom_appBar.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isOn = false ;
    return Scaffold(
      appBar: CustomAppBar(isOn: isOn,),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: customDrawer(context),
      ),
    );
  }
}
