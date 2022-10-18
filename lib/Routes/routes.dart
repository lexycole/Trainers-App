import 'package:trainer/Screens/course_screen/course.dart';
import '../Screens/trainer_screen/trainer.dart';
import '../Screens/trainers_and_courses_screen/trainer_and_courses.dart';

const routeHome = "/trainer_and_course";
const routeAddTrainer = "/trainer";
const routeAddCourse = "/course";

var routes = {
  routeHome: (context) => TrainersAndCourses(title: 'trainer and course'),
  routeAddTrainer: (context) => const TrainerScreen(title: 'trainer'),
  routeAddCourse: (context) => const CourseScreen(title: 'course'),
};
