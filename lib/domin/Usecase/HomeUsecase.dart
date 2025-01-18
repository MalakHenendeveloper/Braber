import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Repsitory/HomeRepository.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeUsecase{
  HomeRepository home;
  HomeUsecase({required this.home});
    Future<Either<Fauilers, UserModel>> invok(String userid)async{
      return await home.getUser(userid);
    }
}