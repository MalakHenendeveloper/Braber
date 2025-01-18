import 'package:braber/data/datasource/FireStore.dart';
import 'package:braber/ui/AdminPage/Cubit/AdminPageState.dart';
import 'package:braber/ui/Home/Cubit/HomeState.dart';
import 'package:braber/ui/auth/Admin/Cubit/AdminState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPageViewModel extends Cubit<AdminPageState> {
  AdminPageViewModel() : super(AdminPageInatial());
  void getbookings() {
    emit(AdminPageLoading());
    FireStore.getbooking().listen((snapshot) {
      try {
        var allbookings = snapshot.docs.map((doc) => doc.data()).toList();
        emit(AdminPageSuccess(book: allbookings));
      } catch (e) {
        emit(AdminPageError(fauilers: e.toString()));
      }
    }, onError: (error) {
      emit(AdminPageError(fauilers: error));
    });
  }
}
