import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainer/Routes/routes.dart';
import 'package:trainer/cubit/trainer_cubit.dart';
import 'cubit/course_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TrainerCubit()),
        BlocProvider(create: (_) => CourseCubit()),
      ],
      child: MaterialApp(
        title: 'Trainer App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: routeHome,
        routes: routes,
      ),
    );
  }
}
