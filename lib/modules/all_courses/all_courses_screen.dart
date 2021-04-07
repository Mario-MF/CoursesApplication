import 'package:conditional_builder/conditional_builder.dart';
import 'package:coursesapplication/modules/all_courses/cubit/all_courses_cubit.dart';
import 'package:coursesapplication/modules/all_courses/cubit/all_courses_state.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';

class AllCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => allCoursesCubit()..getCourses(),
        child: BlocConsumer<allCoursesCubit, AllCoursesStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            var model = allCoursesCubit.get(context).model;
            return ConditionalBuilder(
              builder: (context) => SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 650,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) =>
                            courses(model.result.data[index]),
                        itemCount: model.result.data.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ConditionalBuilder(
                      fallback: (context) => Center(
                          child:  GFLoader(   type:GFLoaderType.circle
                          ),
                      ),
                      condition: state is! AllCoursesLoadingMoreState,
                      builder: ( context) => defaulttButton(
                         context: context,
                          text: allCoursesCubit.get(context).currentPage <=
                                  allCoursesCubit.get(context).totalPages
                              ? 'Load More'
                              : 'No more',
                          press: () {
                            if (allCoursesCubit.get(context).currentPage <=
                                allCoursesCubit.get(context).totalPages) {
                              allCoursesCubit.get(context).getMoreCourses();
                            }
                          }),
                    )
                  ],
                ),
              ),
              condition: state is! AllCoursesLoadingState,
              fallback: (context) => Center(
                  child: RefreshProgressIndicator(
                backgroundColor: Color(0xffffc66d),
              )),
            );
          },
        ),
      ),
    );
  }
}
