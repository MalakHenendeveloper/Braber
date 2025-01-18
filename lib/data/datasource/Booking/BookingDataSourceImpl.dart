import 'package:braber/data/datasource/Booking/BookingDataSource.dart';
import 'package:braber/data/datasource/FireStore.dart';
import 'package:braber/data/model/Booking.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BookingDataSource)
class BookingDataSourceImp implements BookingDataSource {
  Future<Either<Fauilers, Booking>> creatbook(Booking book) async {
    try {
      var Book = await FireStore.Bookbraber(book);

      return Right(Book);
    } catch (e) {
      return Left(NetworkError(errormassage: e.toString()));
    }
  }
}
