import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFB91635),
            Color(0xFF621D3C),
            Color(0xFF311937),
          ])),
      child: Text(
        'Hello\nSign in!',
        style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
