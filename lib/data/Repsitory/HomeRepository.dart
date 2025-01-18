import 'package:braber/data/datasource/Home/HomeDataSource.dart';
import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Repsitory/HomeRepository.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository{
HomeDataSource data;
HomeRepositoryImp({required this.data});
  Future<Either<Fauilers, UserModel>> getUser(String userid) async{
   var either=await data.getUser(userid);
   return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}