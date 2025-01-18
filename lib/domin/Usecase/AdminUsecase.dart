import 'package:braber/data/model/Booking.dart';
import 'package:braber/domin/Repsitory/AdminRepository.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';

class AdminUsecase{
  AdminUsecase({required this.admin});
  AdminRepository admin;
  Stream<Either<Fauilers, List<Booking>>>  call(){
 return  admin.getBookings();
 }
}