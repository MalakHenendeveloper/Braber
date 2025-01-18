import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';

abstract class SignupState {}

class SignUpInitial extends SignupState {}

class SignUpLoading extends SignupState {}

class SignUpError extends SignupState {
  Fauilers fauilers;
  SignUpError({required this.fauilers});
}

class SignUpSuccess extends SignupState {
  UserModel user;
  SignUpSuccess({required this.user});
}
