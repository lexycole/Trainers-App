import 'package:flutter/material.dart';
import 'package:trainer/Screens/trainers_and_courses_screen/widgets/item_course.dart';
import 'package:trainer/Screens/trainers_and_courses_screen/widgets/item_trainer.dart';
import 'package:trainer/cubit/course_cubit.dart';
import 'package:trainer/cubit/course_state.dart';
import 'package:trainer/cubit/trainer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Routes/routes.dart';
import '../../cubit/trainer_state.dart';

class TrainersAndCourses extends StatelessWidget {
  TrainersAndCourses({Key? key, required String title}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 01. Trainer and Course Main Title
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "TRAINERS AND COURSES",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Trainers',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          child: const Text(
                            'Add Trainer',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF2697FF),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, routeAddTrainer);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // 02. Trainer Added Data
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: BlocBuilder<TrainerCubit, TrainerState>(
                      buildWhen: (prev, current) {
                    if (prev.list != current.list) {
                      return true;
                    }
                    return false;
                  }, builder: (context, state) {
                    return ListView.separated(
                        separatorBuilder: (_, index) => const Divider(),
                        itemCount: state.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemTrainer(
                            trainers: state.list[index],
                            index: index,
                          );
                        });
                  })),
            ),

            // 03. Course Title and Button
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Courses',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          child: const Text(
                            'Add Course',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF2697FF),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, routeAddCourse);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // 04. Course added data
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: BlocBuilder<CourseCubit, CourseState>(
                      buildWhen: (prev, current) {
                    if (prev.list != current.list) {
                      return true;
                    }
                    return false;
                  }, builder: (context, state) {
                    return ListView.separated(
                        separatorBuilder: (_, index) => const Divider(),
                        itemCount: state.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemCourse(
                            courses: state.list[index],
                            index: index,
                          );
                        });
                  })),
            ),
          ],
        ),
      ],
    ));
  }
}
