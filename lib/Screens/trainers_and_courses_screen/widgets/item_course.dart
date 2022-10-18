import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/course_cubit.dart';
import '../../../models/course.dart';
import '../../course_screen/course.dart';

class ItemCourse extends StatelessWidget {
  const ItemCourse({Key? key, required this.courses, required this.index})
      : super(key: key);

  final Course courses;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Id: ${courses.id}',
                    style: const TextStyle(
                      fontFamily: 'avenir-heavy',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    )),
              ),
              Expanded(
                child: Text('Name: ${courses.name}',
                    style: const TextStyle(
                      fontFamily: 'avenir-heavy',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    )),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text('Hours: ${courses.hours}',
                  style: const TextStyle(
                    fontFamily: 'avenir-heavy',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                  )),
              const SizedBox(
                width: 10.0,
              ),
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CourseScreen(
                            title: 'course',
                          );
                        },
                      ),
                    );
                  }),
              const SizedBox(
                width: 10.0,
              ),
              IconButton(
                  icon: const Icon(Icons.delete_forever_outlined),
                  onPressed: () {
                    BlocProvider.of<CourseCubit>(context).removeData(index);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
