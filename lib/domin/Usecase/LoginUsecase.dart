import 'package:braber/domin/Repsitory/AuthRepsitory.dart';
import 'package:dartz/dartz.dart';
import 'package:braber/data/model/User.dart';

import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Fauilers, UserModel>> invoke(String email, String password) async {
    return await authRepository.login(email: email, password: password);
  }
}
