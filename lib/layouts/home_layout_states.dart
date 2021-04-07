abstract class HomeLayoutStates {}
class HomeLayoutInitialState extends HomeLayoutStates{}
class HomeLayoutLoadingState extends HomeLayoutStates{}
class HomeLayoutSuccessState extends HomeLayoutStates{}
class HomeLayoutErrorState extends HomeLayoutStates{
  final String error;
    HomeLayoutErrorState(this.error);
}
class HomeLayoutIndexState extends HomeLayoutStates{}


