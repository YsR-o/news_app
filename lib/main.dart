import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/local/cash_helper.dart';
import 'package:news_app/shared/styles/themes.dart';

import 'layout/cubit/cubit_theme_mode/mode_cubit.dart';
import 'layout/cubit/cubit_theme_mode/mode_states.dart';
import 'shared/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsAppCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (context) =>
              AppModeCubit()..changeAppMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<AppModeCubit, ModeStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: AppModeCubit.get(context).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const NewsLayout(),
        ),
      ),
    );
  }
}
