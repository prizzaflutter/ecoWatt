import 'package:ecowatt_yassine_askour_flutter/bloc/admin_bloc.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/splash_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc_observer.dart';
import 'firebase_options.dart';
import 'model/SharedPreferencesModel.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   await FirebaseAppCheck.instance.activate(
     androidProvider: AndroidProvider.playIntegrity,
     appleProvider: AppleProvider.appAttest,
   );
  Bloc.observer = MyBlocObserver();
  SharedPreferencesService sharedPreferencesService =  SharedPreferencesService();
  await sharedPreferencesService.initialize();
  runApp(
   const MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(),
    // ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AdminBloc>(create: (context) => AdminBloc()),
          BlocProvider<SignUpBloc>(create: (context) => AdminBloc()),
          BlocProvider<LogInBloc>(create: (context) => AdminBloc()),
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          //  useInheritedMediaQuery: true ,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          // debugShowCheckedModeBanner: false,
          // title: 'Flutter Demo',
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          home: const SplashScreen(),
        ));
  }
}
/// todo  3b774aeb-9991-4010-b1ee-345dd94700f3 token