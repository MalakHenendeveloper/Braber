import 'package:braber/data/model/Booking.dart';
import 'package:braber/domin/Usecase/BookingUsecase.dart';
import 'package:braber/ui/Booking/Cubit/BookingState.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class BookingViewModel extends Cubit<BookingState> {
  BookingViewModel({required this.bookusecase}) : super(BookingInatial());
  BookingUsecase bookusecase;
  TimeOfDay date = TimeOfDay.now();
  var selectedDate = DateTime.now();
  Future<void> showclander(BuildContext context) async {
    var choosedate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (choosedate != null) {

        selectedDate = choosedate;
   emit(BookingDateUpdated(date: selectedDate));
    }
  }

  Future<void> showtime(BuildContext context) async {
    var selecttime = await showTimePicker(context: context, initialTime: date);
    if (selecttime != null) {
   date = selecttime;
     emit(BookingTimeUpdated(time: date));
    }
  }
  Future<void> Bookservices(Booking book) async {
    emit(BookingLoadiang());
    var result = await bookusecase.invok(book);
    result.fold((error) => emit(BookingError(fauilers: error)),
        (success) => emit(BookingSuccess(book: book)));
  }
}
