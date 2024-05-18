import "package:ecowatt_yassine_askour_flutter/global/global.dart";
import "package:ecowatt_yassine_askour_flutter/ui/main_pages/home_page.dart";
import"package:flutter/material.dart";
import "../../ui/main_pages/other_drawer_screens/about_us_screen.dart";
import "../../ui/main_pages/other_drawer_screens/profile_screen.dart";
import "../../ui/main_pages/report_screens/report_screen.dart";
import "../../ui/main_pages/other_drawer_screens/settings_screen.dart";
import "../../ui/main_pages/auth_screens/sign_out_screen.dart";
import "custom_cached_network_image.dart";
// Widget customDrawer (BuildContext context){
//   SharedPreferences? sharedPreferences = SharedPreferencesService().sharedPreferences;
//   final double height = MediaQuery.of(context).size.height;
//   final double width = MediaQuery.of(context).size.width;
//   return  SafeArea(
//     child: Container(
//       child: ListTileTheme(
//         textColor: Colors.white,
//         iconColor: Colors.white,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Container(
//               width: 128.0,
//               height: 128.0,
//               margin: const EdgeInsets.only(
//                 top: 24.0,
//                 bottom: 64.0,
//               ),
//               clipBehavior: Clip.antiAlias,
//               decoration: const BoxDecoration(
//                 color: Colors.black26,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             ListTile(
//               onTap: () {
//                 Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation)=>HomeScreen(),
//                     transitionsBuilder: (context,animation,secondaryAnimation,child){
//                       const begin = Offset(1.0, 0.0);
//                       const end = Offset.zero;
//                       const curve = Curves.easeInOut;
//                       var tween = Tween(begin: begin, end: end ).chain(CurveTween(curve: curve));
//                       var offsetAnimation = animation.drive(tween);
//                       return SlideTransition(position: offsetAnimation,child: child);
//                     }
//                 ));
//               },
//               leading: const Icon(Icons.home),
//               title: const Text('Home'),
//             ),
//             ListTile(
//               onTap: () {
//                 Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation)=>ProfileScreen(),
//                     transitionsBuilder: (context,animation,secondaryAnimation,child){
//                       const begin = Offset(1.0, 0.0);
//                       const end = Offset.zero;
//                       const curve = Curves.easeInOut;
//                       var tween = Tween(begin: begin, end: end ).chain(CurveTween(curve: curve));
//                       var offsetAnimation = animation.drive(tween);
//                       return SlideTransition(position: offsetAnimation,child: child);
//                     }
//                 ));
//               },
//               leading: const Icon(Icons.account_circle_rounded),
//               title: const Text('Profile'),
//             ),
//             ListTile(
//               onTap: () {},
//               leading: const Icon(Icons.favorite),
//               title: const Text('Report'),
//             ),
//             ListTile(
//               onTap: () {},
//               leading: const Icon(Icons.settings),
//               title: const Text('Settings'),
//             ),
//             ListTile(
//               onTap: () {},
//               leading: const Icon(Icons.person),
//               title: const Text('About us'),
//             ),
//             const Spacer(),
//             DefaultTextStyle(
//               style: const TextStyle(
//                 fontSize: 12,
//                 color: Colors.white54,
//               ),
//               child: Container(
//                 margin: const EdgeInsets.symmetric(
//                   vertical: 16.0,
//                 ),
//                 child: const Text('Terms of Service | Privacy Policy'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

Widget customDrawer (BuildContext context){
  return SafeArea(
    child: ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 128.0,
            height: 128.0,
            margin: const EdgeInsets.only(
              top: 24.0,
              bottom: 64.0,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.black26,
              shape: BoxShape.circle,
            ),
            child: cachedNetworkImage(image: image,width: 140, height: 140),
          ),
          ListTile(
            onTap: () {
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
            },
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                  const ProfileScreen(),
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
            },
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                  const NewReportScreen(),
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
            },
            leading: const Icon(Icons.favorite),
            title: const Text('Report'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                  const SettingsScreen(),
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
            },
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                  const AboutUsScreen(),
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
            },
            leading: const Icon(Icons.person),
            title: const Text('About us'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                  const SignOutScreen(),
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
            },
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
          ),
          const Spacer(),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white54,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: const Text('Terms of Service | Privacy Policy'),
            ),
          ),
        ],
      ),
    ),
  );
}
