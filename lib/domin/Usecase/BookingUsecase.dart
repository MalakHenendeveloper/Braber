import 'package:braber/data/model/Booking.dart';
import 'package:braber/domin/Repsitory/BookingRepository.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookingUsecase{
  BookingRepository bookrepo;
  BookingUsecase({required this.bookrepo});
  Future<Either<Fauilers, Booking>> invok(Booking book)async{
  return await bookrepo.creatbook(book);
  }
}