abstract class AppStates {}
class AppInitialState extends AppStates{}
class AppLoadingState extends AppStates{}
class AppSuccessState extends AppStates{}
class AppErrorState extends AppStates{
  final String error;
  AppErrorState(this.error);
}


class AppLoadingCoursesState extends AppStates{}
class AppSuccessCoursesState extends AppStates{}
class AppErrorCoursesState extends AppStates{
  final String error;
  AppErrorCoursesState(this.error);
}

class ApploadLocalization extends AppStates{}
class AppchangeAppDirection extends AppStates{}
class AppchangeDarkMode extends AppStates{}
