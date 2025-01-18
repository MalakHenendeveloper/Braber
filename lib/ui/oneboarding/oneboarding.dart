import 'package:braber/Core/sources/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Oneboarding extends StatelessWidget {
  const Oneboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2b1615),
      body: Container(
        margin: EdgeInsets.only(top: 150.h),
        child: Column(
          children: [
            Image.asset(AppImages.braber),
            SizedBox(
              height: 80.h,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(22.r)),
                child: Text(
                  'Get a Stylish Haircut',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
