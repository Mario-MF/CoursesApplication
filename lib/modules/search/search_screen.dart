
import 'package:conditional_builder/conditional_builder.dart';
import 'package:coursesapplication/modules/search/cubit/search_cubit.dart';
import 'package:coursesapplication/modules/search/cubit/search_states.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:coursesapplication/shared/cubit/shared_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';

class SearchScreen extends  StatelessWidget {
  var searchCont=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {


        },
        builder: (context, state) {
          var model = SearchCubit.get(context).modelSearch;
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: defaultFformField(
                      controller: searchCont,
                      context: context,
                      title: getLocalization(context).search,
                      type: TextInputType.text,
                      onFieldSubmitted: (value){
                        if(formKey.currentState.validate()){
                          SearchCubit.get(context).getCoursesSearch(value);

                        }

                      }
                    ),
                  ),
                ),

                Expanded(
                  child: ConditionalBuilder(
                    fallback:  (context) => Center(
                              child:  GFLoader(   type:GFLoaderType.circle
                       ),),
                    condition: state is! SearchLoadingState,
                    builder: (BuildContext context) {
                      return  ConditionalBuilder(
                        builder: (context) => ListView.separated(
                          shrinkWrap: true,
                          itemBuilder:
                              (BuildContext context, int index) =>
                              courses(model.result.data[index]),
                          itemCount: model.result.data.length,
                          separatorBuilder:
                              (BuildContext context, int index) =>
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors.grey,
                              ),
                        ),
                        condition: model != null && model.result.data.length > 0,
                        fallback: (context) => Text(getLocalization(context).enterSearch)
                      );
                    },

                  ),
                ),
              ],
            ),
          );
        });
  }
}
