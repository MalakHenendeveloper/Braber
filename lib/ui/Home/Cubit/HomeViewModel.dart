import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Usecase/HomeUsecase.dart';
import 'package:braber/ui/Home/Cubit/HomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel({required this.home}) : super(HomeInitail());
  HomeUsecase home;

  Future<void> getUser(String userid) async {
    var result = await home.invok(userid);
    result.fold((error) => emit(HomeError(fauilers: error)),
        (success) => emit(HomeSuccess(user: success)));
  }
}
