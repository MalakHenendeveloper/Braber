import 'package:braber/domin/Usecase/LoginUsecase.dart';
import 'package:braber/ui/auth/Login/cubit/LoginState.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel({required this.loginUseCase}) : super(LoginInatial());
  LoginUseCase loginUseCase;
  var email = TextEditingController();
  var password = TextEditingController();
  Future<void> login() async {
    emit(LoginLoading());
    var result = await loginUseCase.invoke(email.text, password.text);
    result.fold((error) => emit(LoginError(fauilers: error)),
        (success) => emit(LoginSuccess(userModel: success)));
  }
}
