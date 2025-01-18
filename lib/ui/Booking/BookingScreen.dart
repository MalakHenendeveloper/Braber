import 'package:braber/Core/injectable/injectable.dart';
import 'package:braber/Core/sources/Images.dart';
import 'package:braber/data/datasource/FireStore.dart';
import 'package:braber/data/model/Booking.dart';
import 'package:braber/data/model/Services.dart';
import 'package:braber/ui/Booking/Cubit/BookingState.dart';

import 'package:braber/ui/Booking/Cubit/BookingViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key, required this.view});
  ServicesModel view;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var viewmodel = getIt<BookingViewModel>();
  var userid =
      FirebaseAuth.instance.currentUser?.uid ?? 'Vsob2kjDT3NOi6rXwwblKHRFIqj2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2b1615),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: BlocListener<BookingViewModel, BookingState>(
          bloc: viewmodel,
          listener: (context, state) {
            if (state is BookingSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Booking Successful!'),
                ),
              );
            } else if (state is BookingError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.fauilers.errormassage}'),
                ),
              );
            }
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              spacing: 15.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let`s the\njourney Begin ',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(
                  AppImages.discount,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
                Text(
                  widget.view.servicename ?? '',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Color(
                      0XFFb4817e,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    spacing: 5.h,
                    children: [
                      Text(
                        'Set a Date',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => viewmodel.showclander(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            Text(
                              "${viewmodel.selectedDate.day}/${viewmodel.selectedDate.month}/${viewmodel.selectedDate.year}",
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Color(
                      0XFFb4817e,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    spacing: 5.h,
                    children: [
                      Text(
                        'Set a Time',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => viewmodel.showtime(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.alarm,
                              color: Colors.white,
                            ),
                            Text(
                              "${viewmodel.date.format(context)}",
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () async {
                    var username = await FireStore.getuser(userid);
                    var book = Booking(
                      nameservice: widget.view.servicename ?? '',
                      date:
                          "${viewmodel.selectedDate.day}/${viewmodel.selectedDate.month}/${viewmodel.selectedDate.year}",
                      name: username?.name ?? "error",
                      time: viewmodel.date.format(context),
                    );
                    viewmodel.Bookservices(book);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(22.r)),
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
