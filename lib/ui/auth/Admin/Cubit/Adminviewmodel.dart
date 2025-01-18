import 'package:braber/Core/Routes/Routes.dart';
import 'package:braber/domin/Usecase/LoginUsecase.dart';
import 'package:braber/ui/auth/Admin/Cubit/AdminState.dart';
import 'package:braber/ui/auth/Login/cubit/LoginState.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminViewModel extends Cubit<AdminState> {
  AdminViewModel() : super(AdminInitail());

  var email = TextEditingController();
  var password = TextEditingController();
  Future<void> login(BuildContext context) async {
    emit(AdminLoading());
    FirebaseFirestore.instance.collection('Admin').get().then((value) {
      value.docs.forEach((result) {
        if (result.data()['id'] != email.text) {
          print('Error user');
        } else if (result.data()['password'] != password.text) {
          print('Error password');
        } else {
          emit(AdminSuccess());
          print('success');
        }
      });
    });
  }
// Future<void> login() async {
//   FirebaseFirestore.instance.collection('Admin').get().then((value) {
//     value.docs.forEach((result) {
//       // التحقق من الـ ID
//       if (result.data()['id'] != email.text) {
//         print('Error user'); // خطأ في الـ ID
//       } else if (result.data()['password'] != password.text) {
//         print('Error password'); // خطأ في كلمة المرور
//       } else {
//         print('Login successful'); // تسجيل الدخول ناجح
//       }
//     });
//   }).catchError((error) {
//     print('An error occurred: $error'); // التعامل مع الأخطاء
//   });
// }
}
