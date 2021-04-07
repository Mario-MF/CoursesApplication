import 'dart:convert';
import 'package:coursesapplication/models/courses/courses_model.dart';
import 'package:coursesapplication/models/teacher/teacher_model.dart';
import 'package:coursesapplication/modules/home/home_screen_layout.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:coursesapplication/shared/network/end_point.dart';
import 'package:coursesapplication/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates>{
  HomeScreenCubit() : super(HomeScreenInitialState());
  static HomeScreenCubit get(context)=>BlocProvider.of(context);
  CoursesModel model;
  List<Data> dataModel=[];


  TeacherModel modelTeacher;
  List<Teacher> dataModelTeacher=[];


  getCourses() {
    emit(HomeScreenLoadingState());

    DioHelper.postData(
      path: COURSES_END_POINT,
      data: null,
      token: getToken(),
    ).then((value) {
      //print(jsonDecode(value.toString())['result']);

      model = CoursesModel.fromJson(jsonDecode(value.toString()));
      dataModel = model.result.data;
      emit(HomeScreenSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeScreenErrorState(error.toString()));
    });
  }


  getTeacher() {
    emit(HomeScreenLoadingState());

    DioHelper.postData(
      path: TEACHER_END_POINT,
      data: null,
      token: getToken(),
    ).then((value) {
      //print(jsonDecode(value.toString())['result']);

      modelTeacher = TeacherModel.fromJson(jsonDecode(value.toString()));
      dataModelTeacher = modelTeacher.result.data;
      emit(HomeScreenSuccessCoursesState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeScreenErrorCoursesState(error.toString()));
    });
  }





}