import 'package:braber/Core/Widget/CusttomTextField.dart';
import 'package:braber/Core/Widget/custtomText.dart';
import 'package:braber/ui/auth/Login/Widgets/Appbar.dart';
import 'package:braber/ui/auth/Login/Widgets/CusttomCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset:false,

        body: Stack(
          children: [
          Appbar(),
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
              child:Logincard(),
            )
          ],
        ),
      
    );
  }
}
