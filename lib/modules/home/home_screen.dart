import 'package:conditional_builder/conditional_builder.dart';
import 'package:coursesapplication/models/teacher/teacher_model.dart';
import 'package:coursesapplication/modules/all_courses/all_courses_screen.dart';
import 'package:coursesapplication/modules/home/home_screen_cubit.dart';
import 'package:coursesapplication/modules/home/home_screen_layout.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit,HomeScreenStates>(
      builder: (BuildContext context, state) {
        return Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getLocalization(context).teacher,
                    style: TextStyle(
                        color: Color(0xff3d465d),
                        fontSize: 20,
                        height: 1.5,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'AndikaNewBasic'),
                  ),
                  InkWell(
                    onTap: () {
                      // navigateTo(context: context,widget: AllCoursesScreen());
                    },
                    child: Text(
                      getLocalization(context).viewAll,
                      style: TextStyle(
                          color: Color(0xff3d465d),
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'AndikaNewBasic'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
                listener: (BuildContext context, state) {},
                 builder: (BuildContext context, state) {
                  var modelTeacher = HomeScreenCubit.get(context).modelTeacher;
                  return ConditionalBuilder(

                  condition: modelTeacher!= null&&state is! HomeScreenLoadingState,
                    builder: (BuildContext context) { return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Item(modelTeacher.result.data[index], context);
                      },
                      itemCount: modelTeacher.result.data.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Container();
                      },
                    ); },
                    fallback: (context) => Center(
                      child:  GFLoader(   type:GFLoaderType.circle
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 400,
              width: double.infinity,
              child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var model = HomeScreenCubit.get(context).model;
                    return Scaffold(
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    getLocalization(context).bestOf,
                                    style: TextStyle(
                                        color: Color(0xff3d465d),
                                        fontSize: 20,
                                        height: 1.5,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'AndikaNewBasic'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                       navigateTo(context: context,widget: AllCoursesScreen());
                                    },
                                    child: Text(
                                      getLocalization(context).viewAll,
                                      style: TextStyle(
                                          color: Color(0xff3d465d),
                                          fontSize: 15,
                                          height: 1.5,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'AndikaNewBasic'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ConditionalBuilder(
                              builder: (context) => ListView.separated(
                                shrinkWrap: true,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        courses(model.result.data[index]),
                                itemCount: 3, //model.result.data.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              condition: model!= null&& state is! HomeScreenLoadingState,
                              fallback: (context) => Center(
                                child:  GFLoader(   type:GFLoaderType.circle
                                ),
                              ),
                              //     Center(
                              //     child: RefreshProgressIndicator(
                              //   backgroundColor: Color(0xffffc66d),
                              // )),
                            ),

                    ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        );
      },
      listener: (BuildContext context, state) {},
    );
  }

  Widget Item(Teacher data, context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4.50,
      child: ListView(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 35,
              backgroundImage: NetworkImage(data.image),
          ),
          Center(child: Text(data.firstName))??Text('sas')

        ],
      ),
    );
  }
}
