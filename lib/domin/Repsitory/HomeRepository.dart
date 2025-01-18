import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository{
  Future<Either<Fauilers, UserModel>>getUser(String userid);
}