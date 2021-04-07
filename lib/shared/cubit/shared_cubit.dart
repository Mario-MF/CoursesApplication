import 'package:coursesapplication/shared/components/components.dart';
import 'package:coursesapplication/shared/cubit/shared_states.dart';
import 'package:coursesapplication/shared/localization/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  LocalizationModel localizationModel;

  changeLocalization(String code) async {
    saveLocalizationCode(code);

    String translation =
        await rootBundle.loadString('assets/translation/$code.json');
    loadLocalization(json: translation);
    changeAppDirection(code);

  }

  loadLocalization({@required String json}) {
    localizationModel = LocalizationModel.fromJson(json);
    print(json);
    emit(ApploadLocalization());
  }

  List<String> titles = [];

  setTitles() {
    titles.add('');
    titles.add(localizationModel.search);
    titles.add(localizationModel.cart);
    titles.add(localizationModel.settings);
    titles.add(localizationModel.viewAll);
    titles.add(localizationModel.teacher);
    titles.add(localizationModel.bestOf);
    titles.add(localizationModel.english);
    titles.add(localizationModel.arabic);
  }

  TextDirection appDirection = TextDirection.ltr;
//////
  changeAppDirection(String code) {
    appDirection = code=='ar'?TextDirection.rtl:TextDirection.ltr;
    emit(AppchangeAppDirection());
  }
/////
  bool isDarak=false;
  setAppTheme() {
    isDarak= getDarkMode()??false;
    emit(AppchangeDarkMode());
  }
changeAppTheme(bool value) {
  saveDarkMode(value);
    isDarak=value;
    emit(AppchangeDarkMode());
  }
}
