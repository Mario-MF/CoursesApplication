import 'dart:convert';

import 'package:coursesapplication/layouts/home_layout_states.dart';
import 'package:coursesapplication/modules/cart/cart_screen.dart';
import 'package:coursesapplication/modules/home/home_screen.dart';
import 'package:coursesapplication/modules/search/search_screen.dart';
import 'package:coursesapplication/modules/settings/seetings_screen.dart';
import 'package:coursesapplication/shared/cubit/shared_cubit.dart';
import 'package:coursesapplication/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates>{
  HomeLayoutCubit() : super(HomeLayoutInitialState());
  static HomeLayoutCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;

  List<String>titles=[
    'home',
   'search',
   'cart',
   'settings',

  ];

  List<Widget>widgets=[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    SettingsScreen(),
  ];
  changeIndex(int index){
    currentIndex=index;
    emit(HomeLayoutIndexState());

  }
  sendNotification() async
  {
    var model = {
      "to": "/topics/coursesapp",
      "notification": {
        "title": "you have received a message from abdullah mansour",
        "body": "testing body from post man",
        "sound": "default"
      },
      "android": {
        "priority": "HIGH",
        "notification": {
    'click_action': 'FLUTTER_NOTIFICATION_CLICK',
    "notification_priority": "PRIORITY_MAX",
          "sound": "default",
          "default_sound": true,
          "default_vibrate_timings": true,
          "default_light_settings": true
        }
      },
      "data": {
        "url": "hhhhh",
        "id": "yyyyyy",
      }
    };

    await DioHelper.postNotification(
      path: 'fcm/send',
      data: jsonEncode(model),
    ).then((value) {
      print('success');
      emit(HomeLayoutSuccessState());
    }).catchError((e) {
      print('sddddddddddd');
      print(e.toString());
      emit(HomeLayoutErrorState(e.toString()));
    });
  }


}