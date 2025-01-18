import 'package:braber/data/model/Booking.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';

abstract class AdminPageState{}
class AdminPageInatial extends AdminPageState{}
class AdminPageLoading extends AdminPageState{}
class AdminPageError extends AdminPageState{
  String fauilers;
  AdminPageError({required this.fauilers});
}
class AdminPageSuccess extends AdminPageState{
  List<Booking>book;
  AdminPageSuccess({required this.book});
}