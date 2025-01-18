import 'package:braber/Core/Widget/custtomText.dart';
import 'package:braber/data/model/Booking.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Itemadmin extends StatelessWidget {
  Itemadmin({super.key, required this.books});

  Booking books;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
      padding: EdgeInsets.all(10),
      height: 280.h,

      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
         BoxShadow(
           blurRadius: 5,
           spreadRadius: 2,
           color: Colors.black54
         )
        ],
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(colors: [
            Color(0xFFB91635),
            Color(0xFF621D3C),
            Color(0xFF311937),
          ])),
      child: Column(
        spacing: 10.h,
        children: [
          Custtomtext(
            text: 'Service:${books.nameservice}',
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          Custtomtext(
            text: 'Name:${books.name}',
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          Custtomtext(
            text: 'Date:${books.date}',
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          Custtomtext(
            text: 'Time:${books.time}',
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                width: 90.w,
alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.red),
                  child: Custtomtext(
                text: 'Done',
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,

              ))),
        ],
      ),
    );
  }
}
