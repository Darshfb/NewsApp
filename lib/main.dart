import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/AppCubit/cubit.dart';
import 'package:newsapp/AppCubit/states.dart';
import 'package:newsapp/Layout/news_cubit.dart';
import 'package:newsapp/Layout/news_layout_screen.dart';
import 'package:newsapp/Shared/Style/themes.dart';
import 'package:page_transition/page_transition.dart';
import 'package:newsapp/Shared/cache_helper.dart';
import 'package:newsapp/Shared/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  var isDark = CacheHelper.get(key: 'isDark');
  runApp(
    MyApp(isDark),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp(this.isDark);

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: AnimatedSplashScreen(
              //to cover the photo the phone
              splashIconSize: double.infinity,
              duration: 1000,
              splash: Image.asset(
                'assets/images/splashLogo.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              nextScreen: NewsLayout(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.transparent,
            ),
          );
        },
      ),
    );
  }
}
