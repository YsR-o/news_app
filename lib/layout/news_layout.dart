import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

import '../modules/search/search_screen.dart';
import '../shared/components/components.dart';
import 'cubit/cubit_theme_mode/mode_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var newscubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(onPressed: () {
                  navigateTo(context, SearchScreen());
              },
               icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    AppModeCubit.get(context).changeAppMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: newscubit.currentIndex,
            onTap: ((value) {
              newscubit.changeIndex(value);
            }),
            items: const [
              BottomNavigationBarItem(
                label: 'Business',
                icon: Icon(Icons.business),
              ),
              BottomNavigationBarItem(
                  label: 'Sports', icon: Icon(Icons.sports)),
              BottomNavigationBarItem(
                  label: 'scince', icon: Icon(Icons.science)),
            ],
            type: BottomNavigationBarType.fixed,
          ),
          body: newscubit.screens[newscubit.currentIndex],
        );
      },
    );
  }
}
