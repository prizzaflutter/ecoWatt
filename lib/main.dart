import 'package:ecowatt_yassine_askour_flutter/bloc/admin_bloc.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_observer.dart';
import 'firebase_options.dart';
import 'model/SharedPreferencesModel.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  SharedPreferencesService sharedPreferencesService =  SharedPreferencesService();
  await sharedPreferencesService.initialize();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(create: (context) => UserBloc()),
          BlocProvider<SignUpBloc>(create: (context) => UserBloc()),
          BlocProvider<LogInBloc>(create: (context) => UserBloc()),
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ));
  }
}
