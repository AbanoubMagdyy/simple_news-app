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
  bool isThereAnError = false;

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

  Future<void> getAllData() async {
    emit(GetAllDataLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      allNews = value?.data['articles'];
      isThereAnError = false;
      emit(GetAllDataSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      isThereAnError = true;
      emit(GetAllDataError(error.toString()));
    },);
  }

  List<dynamic> business = [];

  Future<void> getBusinessData() async {
    emit(GetBusinessLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      business = value?.data['articles'];
      isThereAnError = false;
      emit(GetBusinessSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      isThereAnError = true;
      emit(GetBusinessError());
    });
  }

  List<dynamic> entertainment = [];

  Future<void> getEntertainmentData() async {
    emit(GetEntertainmentLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      entertainment = value?.data['articles'];
      isThereAnError = false;
      emit(GetEntertainmentSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      isThereAnError = true;
      emit(GetEntertainmentError());
    });
  }

  List<dynamic> health = [];

  Future<void> getHealthData() async {
    emit(GetHealthLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      health = value?.data['articles'];
      isThereAnError = false;
      emit(GetHealthSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      isThereAnError = true;
      emit(GetHealthError());
    });
  }

  List<dynamic> science = [];

  Future<void> getScienceData() async {
    emit(GetScienceLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      science = value?.data['articles'];
      isThereAnError = false;
      emit(GetScienceSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      isThereAnError = true;
      emit(GetScienceError());
    });
  }

  List<dynamic> sports = [];

  Future<void> getSportsData() async {
    emit(GetSportsLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      sports = value?.data['articles'];
      isThereAnError = false;
      emit(GetSportsSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      isThereAnError = true;
      emit(GetSportsError());
    });
  }

  List<dynamic> tech = [];

  Future<void> getTechData() async {
    emit(GetTechLeading());
    DioHelper.getData(query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': '3c7b9e365afd4cd398cdcd2461187440'
    }).then((value) {
      tech = value?.data['articles'];
      isThereAnError = false;
      emit(GetTechSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      isThereAnError = true;
      emit(GetTechError());
    });
  }

  List<dynamic> search = [];

  Future<void> getSearchData({required String qSearch}) async {
    emit(GetSearchLeading());
    DioHelper.getData(
        query: {'q': qSearch, 'apiKey': '3c7b9e365afd4cd398cdcd2461187440'},
        url: 'v2/everything')
        .then((value) {
      search = value?.data['articles'];
      isThereAnError = false;
      emit(GetSearchSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      isThereAnError = true;
      emit(GetSearchError());
    });
  }

}
