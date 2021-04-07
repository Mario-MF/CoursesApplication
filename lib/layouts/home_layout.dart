import 'package:coursesapplication/layouts/home_layout_cubit.dart';
import 'package:coursesapplication/layouts/home_layout_states.dart';
import 'package:coursesapplication/shared/cubit/shared_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title:Text(AppCubit.get(context).titles[HomeLayoutCubit.get(context).currentIndex]) ,
            ),
            body:HomeLayoutCubit.get(context).widgets[HomeLayoutCubit.get(context).currentIndex],
             bottomNavigationBar: Container(
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(
                     30.0,
                   ),
                   topRight: Radius.circular(
                     30.0,
                   ),
                   bottomLeft: Radius.circular(
                     5.0,
                   ),
                   bottomRight: Radius.circular(
                     5.0,
                   ),
                 ),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5),
                     spreadRadius: 5,
                     blurRadius: 20,
                   ),
                 ],
               ),
               child: BottomNavigationBar(
                 backgroundColor: Colors.transparent,
                 elevation: 0.0,

                 type:BottomNavigationBarType.fixed ,
                onTap: (index){
                  HomeLayoutCubit.get(context).changeIndex(index);

                },
                currentIndex: HomeLayoutCubit.get(context).currentIndex,
                items: [

                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),label: 'Home'
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined),label: 'Search'
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_shopping_cart_outlined),label: 'Cart'
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),label: 'Settings'
                  ),
                ],
            ),
             ),
          );
        },
      ),
    );
  }
}
