abstract class HomeScreenStates {}
class HomeScreenInitialState extends HomeScreenStates{}
class HomeScreenLoadingState extends HomeScreenStates{}
class HomeScreenSuccessState extends HomeScreenStates{}
class HomeScreenErrorState extends HomeScreenStates{
  final String error;
  HomeScreenErrorState(this.error);
}


class HomeScreenLoadingCoursesState extends HomeScreenStates{}
class HomeScreenSuccessCoursesState extends HomeScreenStates{}
class HomeScreenErrorCoursesState extends HomeScreenStates{
  final String error;
  HomeScreenErrorCoursesState(this.error);
}
