
import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';


abstract class DataSource {
  Future<Either<Fauilers, UserModel>> login(String email, String password);
  Future<Either<Fauilers, UserModel>> signup(String email, String password, String name);
}