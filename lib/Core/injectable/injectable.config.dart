// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasource/auth/DataSourceImp.dart' as _i299;
import '../../data/datasource/auth/DatatSource.dart' as _i175;
import '../../data/datasource/Booking/BookingDataSource.dart' as _i77;
import '../../data/datasource/Booking/BookingDataSourceImpl.dart' as _i1002;
import '../../data/datasource/Home/Home.dart' as _i216;
import '../../data/datasource/Home/HomeDataSource.dart' as _i1047;
import '../../data/Repsitory/AuthRepsitory.dart' as _i961;
import '../../data/Repsitory/BookingREpositoryImp.dart' as _i985;
import '../../data/Repsitory/HomeRepository.dart' as _i236;
import '../../domin/Repsitory/AuthRepsitory.dart' as _i75;
import '../../domin/Repsitory/BookingRepository.dart' as _i330;
import '../../domin/Repsitory/HomeRepository.dart' as _i483;
import '../../domin/Usecase/BookingUsecase.dart' as _i658;
import '../../domin/Usecase/HomeUsecase.dart' as _i415;
import '../../domin/Usecase/LoginUsecase.dart' as _i920;
import '../../domin/Usecase/Signup.dart' as _i1053;
import '../../ui/auth/Login/cubit/LoginViewModel.dart' as _i819;
import '../../ui/auth/SignUp/cubit/SignUpViewModel.dart' as _i0;
import '../../ui/Booking/Cubit/BookingViewModel.dart' as _i270;
import '../../ui/Home/Cubit/HomeViewModel.dart' as _i290;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i77.BookingDataSource>(() => _i1002.BookingDataSourceImp());
    gh.factory<_i1047.HomeDataSource>(() => _i216.HomeDataSourceImp());
    gh.factory<_i175.DataSource>(() => _i299.authDataSourceimpl());
    gh.factory<_i75.AuthRepository>(
        () => _i961.AuthRepsitoryimp(data: gh<_i175.DataSource>()));
    gh.factory<_i483.HomeRepository>(
        () => _i236.HomeRepositoryImp(data: gh<_i1047.HomeDataSource>()));
    gh.factory<_i920.LoginUseCase>(
        () => _i920.LoginUseCase(authRepository: gh<_i75.AuthRepository>()));
    gh.factory<_i1053.SignupUscase>(
        () => _i1053.SignupUscase(auth: gh<_i75.AuthRepository>()));
    gh.factory<_i819.LoginViewModel>(
        () => _i819.LoginViewModel(loginUseCase: gh<_i920.LoginUseCase>()));
    gh.factory<_i415.HomeUsecase>(
        () => _i415.HomeUsecase(home: gh<_i483.HomeRepository>()));
    gh.factory<_i330.BookingRepository>(() =>
        _i985.BookingRepositoryimp(bookdata: gh<_i77.BookingDataSource>()));
    gh.factory<_i290.HomeViewModel>(
        () => _i290.HomeViewModel(home: gh<_i415.HomeUsecase>()));
    gh.factory<_i0.SignUpViewModel>(
        () => _i0.SignUpViewModel(sign: gh<_i1053.SignupUscase>()));
    gh.factory<_i658.BookingUsecase>(
        () => _i658.BookingUsecase(bookrepo: gh<_i330.BookingRepository>()));
    gh.factory<_i270.BookingViewModel>(
        () => _i270.BookingViewModel(bookusecase: gh<_i658.BookingUsecase>()));
    return this;
  }
}
