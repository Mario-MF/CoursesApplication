abstract class AllCoursesStates{}
class AllCoursesInitialState extends AllCoursesStates{}
class AllCoursesLoadingState extends AllCoursesStates{}
class AllCoursesLoadingMoreState extends AllCoursesStates{}
class  AllCoursesSuccessState extends AllCoursesStates {}

class  AllCoursesErrorState extends AllCoursesStates {
  final String error;

  AllCoursesErrorState(this.error);
}

