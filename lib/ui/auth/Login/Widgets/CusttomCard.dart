import 'package:braber/Core/Routes/Routes.dart';
import 'package:braber/Core/Widget/CusttomTextField.dart';
import 'package:braber/Core/Widget/custtomText.dart';
import 'package:braber/Core/injectable/injectable.dart';
import 'package:braber/ui/auth/Login/cubit/LoginState.dart';
import 'package:braber/ui/auth/Login/cubit/LoginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logincard extends StatelessWidget {
   Logincard({super.key});
var viewmodel=getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
        bloc:viewmodel ,
        listener: (context, state){
          if(state is LoginLoading){
             CircularProgressIndicator();
          }
          else if(state is LoginSuccess){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Welcome !'),
            ));
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pushNamed(context, AppRoutes.home);
            });
          }
          else if(state is LoginError){  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.fauilers.errormassage),
          ));}
        }, child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Custtomtext(
          text: 'Gmail',
          fontSize: 25.sp,
          color: Color(0xFFB91635),
          fontWeight: FontWeight.w500,
        ),
        Custtomtextfield(
          hint: 'Gmail',
          icon: Icons.mail_outline,
          controller: viewmodel.email,
        ),
        SizedBox(
          height: 40.h,
        ),
        Custtomtext(
          text: 'Password',
          fontSize: 25.sp,
          color: Color(0xFFB91635),
          fontWeight: FontWeight.w500,
        ),
        Custtomtextfield(
          hint: 'Password',
          obscure: true,
          icon: Icons.password_outlined,
          controller: viewmodel.password,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.h),
          alignment: Alignment.topRight,
          child: Custtomtext(
            text: 'Forget Password ?',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            viewmodel.login();

          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xFFB91635),
                borderRadius: BorderRadius.circular(22.r)),
            child: Text(
              'Sign in',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, AppRoutes.admin);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            alignment: Alignment.center,
            child: Custtomtext(
              text: 'Are you admin!!',
              color: Color(0xFFB91635),
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Spacer(),

        Container(
            alignment: Alignment.topRight,
            child: Custtomtext(
              text: 'Don`t have  Account ?',
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            )),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.signup);
            },
            child: Custtomtext(
              text: 'Sign up',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              textDirection: TextDirection.rtl,
              color: Color(0xFFB91635),
            )),
      ],
    ),);
  }
}
