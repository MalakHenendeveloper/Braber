import 'dart:io';

import 'package:braber/Core/Routes/Routes.dart';
import 'package:braber/Core/Routes/RoutesManger.dart';
import 'package:braber/Core/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/injectable/injectable.dart';
//flutter pub run build_runner build
void main() async{
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
  ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAAdGOJRizX44QsCGOQ9HZxJ5FWHIxUb6E",
          appId: "1:876532653914:android:8bc7980b8b9ae9adf49d63",
          messagingSenderId: "876532653914",
          projectId: "braber-a8e47"))
  : await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  String route;
  if (user != null) {
    route=AppRoutes.home;

  } else {

    route=AppRoutes.login;
  }
  runApp( MyApp(route: route,  ));
}

class MyApp extends StatelessWidget {
final String route;
   MyApp({super.key, required this.route});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: Size(340, 940),
      builder: (context, child) {

        return MaterialApp(
          home: child,
          theme: ThemeData(
         
              appBarTheme: AppBarTheme(backgroundColor: Color(0xFF2b1615))),
          initialRoute: route,
          onGenerateRoute: RoutesManger.getRoutes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
