import 'package:braber/data/datasource/FireStore.dart';
import 'package:braber/data/datasource/Home/HomeDataSource.dart';
import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeDataSource)
class HomeDataSourceImp implements HomeDataSource {
  Future<Either<Fauilers, UserModel>> getUser(String userid) async {
    try {
      var data = await FireStore.getuser(userid);
      if (data != null) {
        return Right(data);
      } else {
        return Left(ServerError(errormassage: 'User not found'));
      }
    } catch (e) {
      return Left(NetworkError(errormassage: "Failed to retrieve user."));
    }
  }
}
