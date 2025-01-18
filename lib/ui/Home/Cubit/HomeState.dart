import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';

abstract class HomeState{}
class HomeInitail extends HomeState{}
class HomeError extends HomeState{
  Fauilers fauilers;
  HomeError({required this.fauilers});
}
class HomeLoading extends HomeState{}
class HomeSuccess extends HomeState{
  UserModel user;
  HomeSuccess({required this.user});
}