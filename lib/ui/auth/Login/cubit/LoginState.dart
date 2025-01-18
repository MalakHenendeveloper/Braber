import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';

abstract class LoginState{}
class LoginInatial extends LoginState{}
class LoginLoading extends LoginState{}
class LoginError extends LoginState{
  Fauilers fauilers;
  LoginError({required this.fauilers});
}
class LoginSuccess extends LoginState{
  UserModel userModel;
  LoginSuccess( {required this.userModel});
}
