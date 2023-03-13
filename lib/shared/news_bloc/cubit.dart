import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news_app/shared/news_bloc/states.dart';

import '../../network/local/shared_preferences.dart';
import '../../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitialSState());

  static NewsCubit get(context) => BlocProvider.of(context);

  static bool isDark = false;
  IconData iconTheme = Icons.brightness_4_outlined;

  void changeThemeMode({bool? shared}) {
    if (shared == null) {
      isDark = !isDark;
      iconTheme = isDark ? Icons.brightness_4 : Icons.brightness_4_outlined;
      SharedHelper.saveData(key: 'isDark', value: isDark)
          ?.then((value) {
        emit(ChangeThemeMode());
      }
      );
    } else {
      isDark = shared;
      iconTheme = isDark ? Icons.brightness_4 : Icons.brightness_4_outlined;
    }
  }

  List<dynamic> allNews = [];

  void getAllData() {
    emit(GetAllDataLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'apiKey': '0129b5e06179457ca8ed136cf34a1506'
    }).then((value) {
      allNews = value?.data['articles'];
      emit(GetAllDataSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetAllDataError(error.toString()));
    });
  }

  List<dynamic> business = [];

  void getBusinessData() {
    emit(GetBusinessLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      business = value?.data['articles'];
      emit(GetBusinessSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetBusinessError());
    });
  }

  List<dynamic> entertainment = [];

  void getEntertainmentData() {
    emit(GetEntertainmentLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      entertainment = value?.data['articles'];
      emit(GetEntertainmentSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetEntertainmentError());
    });
  }

  List<dynamic> health = [];

  void getHealthData() {
    emit(GetHealthLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      health = value?.data['articles'];
      emit(GetHealthSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetHealthError());
    });
  }

  List<dynamic> science = [];

  void getScienceData() {
    emit(GetScienceLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      science = value?.data['articles'];
      emit(GetScienceSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetScienceError());
    });
  }

  List<dynamic> sports = [];

  void getSportsData() {
    emit(GetSportsLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      sports = value?.data['articles'];
      emit(GetSportsSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetSportsError());
    });
  }

  List<dynamic> tech = [];

  void getTechData() {
    emit(GetTechLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      tech = value?.data['articles'];
      emit(GetTechSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetTechError());
    });
  }

  List<dynamic> search = [];

  void getSearchData({required String qSearch}) {
    emit(GetSearchLeading());
    DioHelper.getData(
            query: {'q': qSearch, 'apiKey': '3c7b9e365afd4cd398cdcd2461187440'},
            url: 'v2/everything')
        .then((value) {
      search = value?.data['articles'];
      emit(GetSearchSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetSearchError());
    });
  }
}
