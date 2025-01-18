import 'package:braber/Core/Routes/Routes.dart';
import 'package:braber/data/model/Services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custtomcard extends StatelessWidget {
  Custtomcard({super.key, required this.view});
  ServicesModel view;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.booking,
          arguments: view,
        );
      },
      child: Container(
        height: 200.h,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFFe29452),
            borderRadius: BorderRadius.circular(18.r)),
        child: Column(
          children: [
            Image.asset(
              view.images!,
              height: 100.h,
            ),
            Text(
              view.servicename!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
