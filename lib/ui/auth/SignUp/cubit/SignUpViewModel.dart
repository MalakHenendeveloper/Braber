import 'package:braber/domin/Usecase/Signup.dart';
import 'package:braber/ui/auth/SignUp/cubit/SignUpstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignUpViewModel extends Cubit<SignupState> {
  SignUpViewModel({required this.sign}) : super(SignUpInitial());
  SignupUscase sign;
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  Future<void> Signup() async {
    emit(SignUpLoading());
    var result = await sign.invok(email.text, password.text, name.text);
    return result.fold((error) => emit(SignUpError(fauilers: error)),
        (success) => emit(SignUpSuccess(user: success)));
  }
}
