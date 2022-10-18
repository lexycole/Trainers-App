import '../models/course.dart';
import 'package:equatable/equatable.dart';

class CourseState extends Equatable {
  List<Course> list = [];

  CourseState({
    required this.list,
  });

  CourseState copyWith({List<Course>? list}) {
    return CourseState(
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [list];
}
