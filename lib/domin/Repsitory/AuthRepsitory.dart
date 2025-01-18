import 'package:dartz/dartz.dart';
import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';

abstract class AuthRepository {
  Future<Either<Fauilers, UserModel>> login({required String email, required String password});
  Future<Either<Fauilers, UserModel>> signup({required String email, required String password, required String name});
}
