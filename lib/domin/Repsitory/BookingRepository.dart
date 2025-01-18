import 'package:braber/data/model/Booking.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository{
  Future<Either<Fauilers, Booking>>creatbook(Booking book);
}