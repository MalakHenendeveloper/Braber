import 'package:braber/data/model/Booking.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:flutter/material.dart';

abstract class BookingState{}
class BookingInatial extends BookingState{}
class BookingLoadiang extends BookingState{}
class BookingError extends BookingState{
  Fauilers fauilers;
  BookingError({required this.fauilers});
}
class BookingSuccess extends BookingState{
  Booking book;
  BookingSuccess({required this.book});
}
class BookingDateUpdated extends BookingState {
   DateTime date;

  BookingDateUpdated({required this.date});
}

class BookingTimeUpdated extends BookingState {
   TimeOfDay time;

  BookingTimeUpdated({required this.time});
}