import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/news_states.dart';
import 'package:newsapp/Modules/business.dart';
import 'package:newsapp/Modules/science.dart';
import 'package:newsapp/Modules/sports.dart';
import 'package:newsapp/Shared/dio_helper.dart';
class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int index = 0;
  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
  ];
  List<String> titles = [
    'Business',
    'Sports',
    'Science',
  ];
  void currentIndex(int value)
  {
    index = value;
    if(index == 1){
      getSports();
    }else if(index == 2){
      getScience();
    }
    emit(BottomBarState());
  }

  List<dynamic> business= [];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'business',
          'apiKey' : 'a758522e6c0e42dfb7ccac62d2ec16e0',
        }).then((value)
    {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports= [];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.length == 0)
    {
      DioHelper.getData(
          url: '/v2/top-headlines',
          query: {
            'country' : 'eg',
            'category' : 'sports',
            'apiKey' : 'a758522e6c0e42dfb7ccac62d2ec16e0',
          }).then((value)
      {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((error)
      {
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }else{
      emit(NewsGetSportsSuccessState());
    }

  }

  List<dynamic> science= [];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.length == 0)
    {
      DioHelper.getData(
          url: '/v2/top-headlines',
          query: {
            'country' : 'eg',
            'category' : 'science',
            'apiKey' : 'a758522e6c0e42dfb7ccac62d2ec16e0',
          }).then((value)
      {
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${value.data['articles']}');
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error)
      {
        print('.........................${error.toString()}');
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic> search= [];
  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q' : value,
          'apiKey' : 'a758522e6c0e42dfb7ccac62d2ec16e0',
        }).then((value)
    {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error)
    {
      print('.........................${error.toString()}');
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }

}
