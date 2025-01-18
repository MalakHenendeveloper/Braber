import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custtomtextfield extends StatelessWidget {
   Custtomtextfield({super.key, required  this.hint, this.obscure=false , required this.icon, this.controller});
String hint;
bool obscure;
IconData icon;
TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return   TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText:hint ,
          hintStyle: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.w500),
          prefixIcon:Icon(icon) ),
      obscureText: obscure,
    );
  }
}
