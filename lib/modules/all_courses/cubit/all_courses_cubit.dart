import 'dart:convert';

import 'package:coursesapplication/models/courses/courses_model.dart';
import 'package:coursesapplication/modules/all_courses/cubit/all_courses_state.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:coursesapplication/shared/network/end_point.dart';
import 'package:coursesapplication/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class allCoursesCubit extends Cubit<AllCoursesStates>{
  allCoursesCubit() : super(AllCoursesInitialState());
static allCoursesCubit get(context)=>BlocProvider.of(context);
  CoursesModel model;
  List<Data> dataModel=[];
  int currentPage=2;
  int totalPages = 0;


  getCourses() {
    emit(AllCoursesLoadingState());

    DioHelper.postData(
      path: COURSES_END_POINT,
      data: null,
      token: getToken(),
      // query:
    ).then((value) {
      //print(jsonDecode(value.toString())['result']);

       model = CoursesModel.fromJson(jsonDecode(value.toString()));
      dataModel = model.result.data;
      totalPages = model.result.lastPage;
      emit(AllCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AllCoursesErrorState(error.toString()));
    });
  }
  getMoreCourses() {
    emit(AllCoursesLoadingMoreState());

    DioHelper.postData(
      path: COURSES_END_POINT,
      data: null,
      token: getToken(),
      // query:
    ).then((value) {
      //print(jsonDecode(value.toString())['result']);

      var model = CoursesModel.fromJson(jsonDecode(value.toString()));
      dataModel.addAll(model.result.data);
      currentPage++;
      emit(AllCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AllCoursesErrorState(error.toString()));
    });
  }



}