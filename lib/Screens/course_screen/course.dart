import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainer/cubit/course_cubit.dart';
import 'package:trainer/models/course.dart';
import 'package:trainer/widgets/rounded_button.dart';
import 'package:trainer/widgets/rounded_input_field.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key, required String title}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final _formKey = GlobalKey<FormState>();
  String id = "";
  String name = "";
  String hours = "";

  void addData(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Course courses = Course(
        id: id,
        name: name,
        hours: hours,
      );
      BlocProvider.of<CourseCubit>(context).addCourses(courses);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "ADD COURSE",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Course Id",
                onChanged: (String? value) {
                  id = value!;
                },
              ),
              RoundedInputField(
                hintText: "Course Name",
                onChanged: (String? value) {
                  name = value!;
                },
              ),
              RoundedInputField(
                hintText: "Course Hours",
                onChanged: (String? value) {
                  hours = value!;
                },
              ),
              RoundedButton(
                text: "Add",
                press: () {
                  addData(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
