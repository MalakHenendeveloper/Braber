import 'package:braber/data/model/Booking.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
//
// abstract class AdminRepository {
//   Stream<List<Booking>>getBooking();
// }
abstract class AdminRepository {
  Stream<Either<Fauilers, List<Booking>>> getBookings();
}