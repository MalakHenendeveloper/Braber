import 'package:braber/data/datasource/Booking/BookingDataSource.dart';
import 'package:braber/data/model/Booking.dart';
import 'package:braber/domin/Repsitory/BookingRepository.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BookingRepository)
 class BookingRepositoryimp implements BookingRepository{
 BookingDataSource bookdata;
 BookingRepositoryimp({required this.bookdata});
  Future<Either<Fauilers, Booking>> creatbook(Booking book)async {
  var Book=await bookdata.creatbook(book);
 return Book.fold((error)=>Left(error), (response)=>Right(response));
  }
}