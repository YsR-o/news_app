import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit_theme_mode/mode_states.dart';
import '../../../shared/local/cash_helper.dart';

class AppModeCubit extends Cubit<ModeStates> {
  AppModeCubit() : super(InitialModeState());
  static AppModeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CashHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(ChangeModeState());
    });
  }
}
