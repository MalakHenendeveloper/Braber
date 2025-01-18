import 'package:braber/Core/Routes/Routes.dart';
import 'package:braber/Core/Widget/CusttomTextField.dart';
import 'package:braber/Core/Widget/custtomText.dart';
import 'package:braber/ui/auth/SignUp/widgets/SignUpcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFFB91635),
                Color(0xFF621D3C),
                Color(0xFF311937),
              ])),
              child: Custtomtext(
                text: 'Create Your\nAccount',
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 230.h),
            padding: EdgeInsets.only(
                left: 25.w, bottom: 20.h, right: 25.w, top: 20.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r))),
            child: Signupcard(),
          )
        ],
      ),
    );
  }
}
