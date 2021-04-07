import 'dart:convert';

import 'package:coursesapplication/models/courses/courses_model.dart';
import 'package:coursesapplication/modules/search/cubit/search_states.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:coursesapplication/shared/network/end_point.dart';
import 'package:coursesapplication/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context)=>BlocProvider.of(context);
  
  CoursesModel modelSearch;
  List<Data> dataModelSearch=[];


  int currentPageSearch=2;
  int totalPagesSearch = 0;




  getCoursesSearch(String value) {
    emit(SearchLoadingState());

    DioHelper.postData(
      path: SEARCH_END_POINT,
      data: {
        'q':value,
        'type':1,
      },
      token: getToken(),
    ).then((value) {
      print(jsonDecode(value.toString())['result']['data']);

      modelSearch = CoursesModel.fromJson(jsonDecode(value.toString()));
      dataModelSearch = modelSearch.result.data;
      dataModelSearch=modelSearch.result.lastPage;

      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState(error.toString()));
    });
  }
  getMoreCoursesSearch() {
    emit(SearchLoadingMoreState());

    DioHelper.postData(
      path: COURSES_END_POINT,
      data: null,
      token: getToken(),
      // query:
    ).then((value) {
      //print(jsonDecode(value.toString())['result']);

      var model = CoursesModel.fromJson(jsonDecode(value.toString()));
      dataModelSearch.addAll(model.result.data);
      currentPageSearch++;
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState(error.toString()));
    });
  }


}