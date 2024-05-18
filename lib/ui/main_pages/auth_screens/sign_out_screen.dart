import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/splash_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/custom_widgets/custom_advanced_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../home_page.dart';

class SignOutScreen extends StatefulWidget {
  const SignOutScreen({super.key});

  @override
  State<SignOutScreen> createState() => _SignOutScreenState();
}

class _SignOutScreenState extends State<SignOutScreen> {
  @override
  Widget build(BuildContext context) {
    AdvancedDrawerController controller = AdvancedDrawerController();
    return advancedDrawerWidget(
      showSwitch: true,
      action: Text(""),
      isAppBar: false,
        context: context, controller: controller, body: Center(
      child :Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Dialog(
            child: AlertDialog(
               content: const Text("Are you sure!! \n you want to SignOut"),
              actions: [
                TextButton(onPressed: (){
                  auth.signOut().then((value){
                    Navigator.of(context).pushAndRemoveUntil(PageRouteBuilder(
                      pageBuilder: (context,animation,secondaryAnimation)=>const SplashScreen(),
                     transitionsBuilder: (context, animation , secondaryAnimation, child ){
                        return FadeTransition(opacity: animation , child:  child,);

                     }
                    ), (route) => false);
                  });
                }, child:  const Text("Yes")),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                      const HomeScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        // const begin = Offset(1.0, 0.0);
                        // const end = Offset.zero;
                        // const curve = Curves.easeInOut;
                        // var tween = Tween(begin: begin, end: end)
                        //     .chain(CurveTween(curve: curve));
                        // var offsetAnimation = animation.drive(tween);
                        return FadeTransition(
                            opacity: animation, child: child);
                      },
                      transitionDuration: const Duration(milliseconds: 600),
                      reverseTransitionDuration: const Duration(milliseconds: 600),
                    ),
                  );

                }, child: const Text("No"))
              ],
            ),
          ),
        ],
      )
    ));
  }
}
