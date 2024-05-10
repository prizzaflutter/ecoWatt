import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/profile_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/advanced_drawer_widget.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_appBar.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../global/global.dart';
import 'home_page.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.size(context);
    return advancedDrawerWidget(
        context: context,
        controller: _advancedDrawerController,
        body: const Center(child: const Text("Settings")),
        isAppBar: true);
  }
}
