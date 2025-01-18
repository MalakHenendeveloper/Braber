import 'package:braber/Core/Widget/custtomText.dart';
import 'package:braber/ui/AdminPage/Cubit/AdminPageState.dart';
import 'package:braber/ui/AdminPage/Cubit/AdminPageViewModel.dart';
import 'package:braber/ui/AdminPage/ItemAdmin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Adminscreen extends StatelessWidget {
  Adminscreen({super.key});
  var viewmodel = AdminPageViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AdminPageViewModel, AdminPageState>(
            bloc: viewmodel..getbookings(),
            builder: (context, state) {
              if (state is AdminPageSuccess) {
                var books = state.book;
                return Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(

                      child: Custtomtext(
                        text: 'All Bookings',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      height: 850.h,
                      child: ListView.builder(
                          itemCount: state.book.length,
                          itemBuilder: (context, index) {
                        return Itemadmin(
                          books:state.book[index],
                        );
                      }),
                    )
                  ],
                );
              } else if (state is AdminPageError) {
                return Center(child: Text("Error loading bookings"));
              }
              else if(state is AdminPageLoading){
                return Center(
                  child: Text('Lading data'),
                );
              }
              return Center(
                child: Text('data'),
              );
            }));
  }
}
