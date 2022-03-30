import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/AppCubit/cubit.dart';
import 'package:newsapp/Layout/news_cubit.dart';
import 'package:newsapp/Layout/news_states.dart';
import 'package:newsapp/Modules/SearchScreen/search_screen.dart';
import 'package:newsapp/Shared/cache_helper.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.index],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                    var c = CacheHelper.get(key: 'isDark').toString();
                  },
                  icon: const Icon(Icons.brightness_4_outlined)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SearchScreen();
                    }));
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: cubit.screens[cubit.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.index,
            elevation: 25,
            onTap: (value) {
              cubit.currentIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_rounded), label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'Science'),
            ],
          ),
        );
      },
    );
  }
}
