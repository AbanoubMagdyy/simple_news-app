import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news_app/components/constants.dart';
import 'package:simple_news_app/shared/bolc_observer.dart';
import 'package:simple_news_app/shared/news_bloc/cubit.dart';
import 'package:simple_news_app/shared/news_bloc/states.dart';
import 'package:simple_news_app/style/themes.dart';
import 'layout/news_screen.dart';
import 'network/local/shared_preferences.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
 await SharedHelper.init();
 await checkInternetConnectivity();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  bool dark = SharedHelper.getAllData(key: 'isDark') ?? true;
  runApp(MyApp(dark));
}

class MyApp extends StatelessWidget {
  final bool dark;

  const MyApp(this.dark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..changeThemeMode(shared: dark),

      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const NewsScreen(),
            theme: lightTheme,
            themeMode: NewsCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: darkTheme
          );
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
