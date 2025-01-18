import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Repsitory/AuthRepsitory.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'Fauilers.dart';
@injectable
class  SignupUscase{
  AuthRepository auth;
  SignupUscase({required this.auth});
  Future<Either<Fauilers, UserModel>> invok(String email, String password, String name)async{
  return  await auth.signup(email: email, password: password, name:name );
  }
}