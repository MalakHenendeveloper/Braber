import 'package:braber/Core/injectable/injectable.dart';
import 'package:braber/Core/sources/Images.dart';
import 'package:braber/data/model/Services.dart';
import 'package:braber/ui/Home/Cubit/HomeState.dart';
import 'package:braber/ui/Home/Cubit/HomeViewModel.dart';
import 'package:braber/ui/Home/custtomcard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  List<ServicesModel> view = [
    ServicesModel(images: AppImages.shaving, servicename: 'Classic Shaving'),
    ServicesModel(images: AppImages.hair, servicename: 'Hair Washing'),
    ServicesModel(images: AppImages.beard, servicename: 'Beard Trimming'),
    ServicesModel(images: AppImages.facials, servicename: 'Facials'),
    ServicesModel(images: AppImages.kids, servicename: 'Kids HairCutting'),
    ServicesModel(images: AppImages.cutting, servicename: 'Hair Cutting')
  ];
  var viewmodel=getIt<HomeViewModel>();
  final userId = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b1615),
      body:BlocBuilder<HomeViewModel, HomeState>(
          bloc: viewmodel..getUser(userId??""),
          builder: (context, state){
            if(state is HomeLoading){
      return     Center(child: CircularProgressIndicator(),);
            }
            else if(state is HomeError){
              Center(child: Text(state.fauilers.errormassage),);
            }
            else if(state is HomeSuccess){
              return  Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 60.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              state.user.name??'lokkkkk',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            AppImages.boy,
                            height: 50.h,
                            width: 40.w,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Divider(
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Services',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 630.h,
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemCount: view.length,
                          itemBuilder: (context, i) {
                            return Custtomcard(view: view[i]);
                          }),
                    )
                  ],
                ),
              );
            }
            return Container();
          }),
    );
  }
}