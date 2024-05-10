import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/splash_screen.dart';
import 'package:ecowatt_yassine_askour_flutter/widgets/advanced_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

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
                      pageBuilder: (context,animation,secondaryAnimation)=> SplashScreen(),
                     transitionsBuilder: (context, animation , secondaryAnimation, child ){
                        return FadeTransition(opacity: animation , child:  child,);

                     }
                    ), (route) => false);
                  });
                }, child:  const Text("Yes")),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text("No"))
              ],
            ),
          ),
        ],
      )
    ));
  }
}
