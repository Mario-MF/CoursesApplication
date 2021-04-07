import 'dart:convert';

import 'package:coursesapplication/modules/login/cubit/login_states.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:coursesapplication/shared/network/end_point.dart';
import 'package:coursesapplication/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginStateInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);



  bool showPassword = true;
  void togglevisibility() {
      showPassword = !showPassword;
      emit(LoginStateTogglePass());
  }

  void login({String name,String password}){
    emit(LoginStateLoading());
    DioHelper.postData(
      path: LOGIN_END_POINT,
      data: {
        'grant_type':'password',
        'client_id':'1',
        'client_secret':'UFj2FJ7X2jQfSjtptUIadua4rb0yeZjKvVaS55T9',
        'username':name,
        'password':password,
      }
    ).then((value) {
      print(jsonDecode(value.toString())['access_token']);
      String token=jsonDecode(value.toString())['access_token']as String;
      saveToken(token).then((value) {
        print('success');
      }).catchError((error){
        print(error.toString());
      });


      print(jsonDecode(value.toString())['access_token']);
      print(value.toString());
      emit(LoginStateSuccess());

      
}).catchError((error){
  print(error.toString());
  emit(LoginStateError(error.toString()));
    });
}


}
