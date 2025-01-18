import 'dart:typed_data';

import 'package:braber/Core/Routes/Routes.dart';
import 'package:braber/Core/Widget/CusttomTextField.dart';
import 'package:braber/Core/Widget/custtomText.dart';
import 'package:braber/Core/injectable/injectable.dart';
import 'package:braber/ui/auth/SignUp/cubit/SignUpViewModel.dart';
import 'package:braber/ui/auth/SignUp/cubit/SignUpstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signupcard extends StatelessWidget {
   Signupcard({super.key});
var viewmodel=getIt<SignUpViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpViewModel, SignupState>(
        bloc:viewmodel ,
        listener: (context, state){
          if (state is SignUpLoading){
CircularProgressIndicator();
          }  else if (state is SignUpError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Error ${state.fauilers.errormassage}!'),
            ));
          }  else if (state is SignUpSuccess){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Success , Register'),
            ));
          }
        },
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Custtomtext(
            text: 'Name',
            color: Color(0xFFB91635),
            fontSize: 25.sp,
            fontWeight: FontWeight.w500),

        Custtomtextfield(hint: 'Name', icon: Icons.person, controller: viewmodel.name,),
        SizedBox(
          height: 30.h,
        ),
        Custtomtext(
            text: 'Gmail',
            color: Color(0xFFB91635),
            fontSize: 25.sp,
            fontWeight: FontWeight.w500),

        Custtomtextfield(hint: 'Gmail', icon: Icons.mail_outlined, controller: viewmodel.email,),
        SizedBox(
          height: 30.h,
        ),
        Custtomtext(
            text: 'Password',
            color: Color(0xFFB91635),
            fontSize: 25.sp,
            fontWeight: FontWeight.w500),

        Custtomtextfield(hint: 'Password', icon: Icons.password_outlined, obscure: true,controller: viewmodel.password,),

        SizedBox(
          height: 45.h,
        ),
        InkWell(
          onTap: () {
            viewmodel.Signup();
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xFFB91635),
                borderRadius: BorderRadius.circular(22.r)),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Spacer(),
        Container(
            alignment: Alignment.topRight,
            child: Text(
              'Already have account',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            )),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.login);
            },
            child: Text(
              'Sign in',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: Color(0xFFB91635),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            )),
      ],
    ),
    );
  }
}
