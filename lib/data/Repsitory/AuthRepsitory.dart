import 'package:braber/data/datasource/auth/DatatSource.dart';
import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Repsitory/AuthRepsitory.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AuthRepository)
class AuthRepsitoryimp implements AuthRepository{
 DataSource data;
 AuthRepsitoryimp({required this.data});
  @override
  Future<Either<Fauilers, UserModel>> login({required String email, required String password})async {
  var either=  await data.login(email, password);
  return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Fauilers, UserModel>> signup({required String email, required String password ,required String name,}) async{
   var either=await data.signup(email, password, name);
   return either.fold((error)=>Left(error), (response)=>Right(response));
  }


}