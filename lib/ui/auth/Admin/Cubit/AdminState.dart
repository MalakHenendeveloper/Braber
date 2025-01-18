import 'package:braber/domin/Usecase/Fauilers.dart';

abstract class AdminState{}
class AdminInitail extends AdminState{}
class AdminLoading extends AdminState{}
class AdminError extends AdminState{
  Fauilers fauilers;
  AdminError({required this.fauilers});
}
class AdminSuccess extends AdminState{}
