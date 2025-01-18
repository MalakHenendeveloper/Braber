import 'package:braber/Core/Routes/Routes.dart';
import 'package:braber/Core/Widget/CusttomTextField.dart';
import 'package:braber/Core/Widget/custtomText.dart';

import 'package:braber/ui/auth/Admin/Cubit/AdminState.dart';
import 'package:braber/ui/auth/Admin/Cubit/Adminviewmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Admin extends StatelessWidget {
  Admin({super.key});
  var viewmodel = AdminViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminViewModel, AdminState>(
      bloc: viewmodel,
      listener: (context, state) {
        if (state is AdminLoading) {
          CircularProgressIndicator();
        } else if (state is AdminSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Welcome !'),
          ));
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushNamed(context, AppRoutes.adminpage);
          });
        } else if (state is AdminError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.fauilers.errormassage),
          ));
        }
      },
      child: Column(
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
              viewmodel.login(context);
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
        ],
      ),
    );
  }
}
