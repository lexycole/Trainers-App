import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainer/cubit/trainer_cubit.dart';
import 'package:trainer/widgets/rounded_button.dart';
import 'package:trainer/widgets/rounded_input_field.dart';
import 'package:trainer/models/trainer.dart';

class TrainerScreen extends StatefulWidget {
  const TrainerScreen({Key? key, required String title}) : super(key: key);

  @override
  _TrainerScreenState createState() => _TrainerScreenState();
}

class _TrainerScreenState extends State<TrainerScreen> {
  final _formKey = GlobalKey<FormState>();
  String id = "";
  String name = "";
  String courses = "";

  void addData(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Trainer trainers = Trainer(id: id, name: name, courses: courses);
      BlocProvider.of<TrainerCubit>(context).addTrainers(trainers);
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
              "ADD TRAINER",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedInputField(
                hintText: "Trainer Id",
                onChanged: (String? value) {
                  id = value!;
                }),
            RoundedInputField(
                hintText: "Trainer Name",
                onChanged: (String? value) {
                  name = value!;
                }),
            RoundedInputField(
                hintText: "Courses",
                onChanged: (String? value) {
                  courses = value!;
                }),
            RoundedButton(
              text: "Add",
              press: () {
                addData(context);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
