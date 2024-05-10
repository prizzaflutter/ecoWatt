import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../global/global.dart';
import '../../widgets/custom_appBar.dart';
import '../../widgets/custom_drawer.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
            isOn: true,
            leading: IconButton(
              onPressed: ()=> handleMenuButtonPressed(_advancedDrawerController),
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(value.visible ? Icons.clear : Icons.menu),
                      key: ValueKey<bool>(value.visible));
                },
              ),
            ),
          ),
          body: const  Center(child: Text("About us")),
        ));
  }

}
