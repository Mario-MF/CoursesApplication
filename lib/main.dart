import 'package:coursesapplication/layouts/home_layout.dart';
import 'package:coursesapplication/modules/search/cubit/search_cubit.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:coursesapplication/shared/cubit/shared_cubit.dart';
import 'package:coursesapplication/shared/cubit/shared_states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home/home_screen_cubit.dart';
import 'modules/intro/intro_screen.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  FirebaseMessaging().subscribeToTopic('coursesapp');

  await initApp();
  var token = getToken();
  var locale = getLocalizationCode();
  String translation =
      await rootBundle.loadString('assets/translation/${locale ?? 'ar'}.json');
  print(translation);

  runApp(MyApp(
    token,
    translation: translation,
    code: locale ?? 'ar',
  ));
}

class MyApp extends StatelessWidget {
  final String token;
  final String translation;
  final String code;

  MyApp(this.token, {this.translation, this.code});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => HomeScreenCubit()
                ..getCourses()
                ..getTeacher()),
          BlocProvider(create: (BuildContext context) => SearchCubit()),
          BlocProvider(
              create: (BuildContext context) => AppCubit()..setAppTheme()
                ..changeAppDirection(code)
                ..loadLocalization(
                  json: this.translation,
                )
                ..setTitles()),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) => MaterialApp(
            title: 'Courses',
            theme: ThemeData(primaryColor: Color(0xffff8040)),
            darkTheme: ThemeData.from(colorScheme: ColorScheme.dark()),
            themeMode: AppCubit.get(context).isDarak?ThemeMode.dark:ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: token != null
                ?Directionality(
              textDirection: AppCubit.get(context).appDirection,
                child: HomeLayout())
                : IntroScreen(),
          ),
        ));
  }
}
