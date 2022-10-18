import 'package:bloc/bloc.dart';
import '../models/course.dart';
import '../cubit/course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseState(list: const []));

  void addCourses(Course courses) {
    List<Course> _listCourses = List.from(state.list);
    _listCourses.add(courses);
    emit(state.copyWith(list: _listCourses));
  }

  void removeData(int index) {
    List<Course> list_courses = List.from(state.list);
    list_courses.removeAt(index);
    emit(state.copyWith(list: list_courses));
  }
}
