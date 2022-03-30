import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/AppCubit/states.dart';
import 'package:newsapp/Shared/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheHelper.putBool(key: 'isDark', value: isDark).then((value)
      {
        print('zzzzzzzzzzzzz ${isDark.toString()}');
        emit(AppChangeModeState());
      });
      emit(AppChangeModeState());
    }


  }
}
