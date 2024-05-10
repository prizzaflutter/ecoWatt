import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../global/global.dart';
import 'custom_appBar.dart';
import 'custom_drawer.dart';
Widget advancedDrawerWidget ({required BuildContext context,required AdvancedDrawerController controller, required Widget body, required bool isAppBar}){
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
      controller: controller,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,

      // openScale: 1.0,
      disabledGestures: true,
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
        appBar: isAppBar ? CustomAppBar(
          isOn: true,
          leading: IconButton(
            onPressed:()=>handleMenuButtonPressed(controller),
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: controller,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    key: ValueKey<bool>(value.visible),
                    child: Icon(value.visible ? Icons.clear : Icons.menu));
              },
            ),
          ),
        ) : null,
        body:body,
      ),
  );
}