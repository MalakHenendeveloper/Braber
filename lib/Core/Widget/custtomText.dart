import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custtomtext extends StatelessWidget {
   Custtomtext({super.key,required this.text, this.fontSize, this.fontWeight, this.color,
   this.textDirection
   });
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
   TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return   Text(
     text,
      textDirection:textDirection ,
      style: TextStyle(
          color:color,
          fontSize:fontSize,
          fontWeight:fontWeight ),
    );
  }
}
