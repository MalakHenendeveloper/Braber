import 'package:braber/Core/Routes/Routes.dart';
import 'package:braber/data/model/Services.dart';
import 'package:braber/ui/auth/Admin/AdminAuth.dart';
import 'package:braber/ui/Booking/BookingScreen.dart';
import 'package:braber/ui/Home/HomePage.dart';

import 'package:braber/ui/auth/Login/Login.dart';
import 'package:braber/ui/auth/SignUp/SignUp.dart';
import 'package:braber/ui/oneboarding/oneboarding.dart';
import 'package:flutter/material.dart';

import '../../ui/AdminPage/Adminscreen.dart';

class RoutesManger {
  static Route<dynamic>? getRoutes(RouteSettings route) {
    switch (route.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => Homepage());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => Oneboarding());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => Login());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => SignUp());
      case AppRoutes.admin:
        return MaterialPageRoute(builder: (_) => Adminauth());
      case AppRoutes.adminpage:
        return MaterialPageRoute(builder: (_) => Adminscreen());
      case AppRoutes.booking:
        final ServicesModel view = route.arguments as ServicesModel;
        return MaterialPageRoute(
            builder: (_) => BookingScreen(
                  view: view,
                ));
      default:
        return null;
    }
  }
}
