import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/trainer_cubit.dart';
import '../../../models/trainer.dart';
import '../../course_screen/course.dart';
import '../../trainer_screen/trainer.dart';

class ItemTrainer extends StatelessWidget {
  const ItemTrainer({
    Key? key, 
    required this.trainers, 
    required this.index
    }) : super(key: key);

  final Trainer trainers;
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
                child: Text('Id: ${trainers.id}',
                    style: const TextStyle(
                        fontFamily: 'avenir-heavy',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      )
                ),
                ),
                const SizedBox(width: 2.0),
                Text('Name: ${trainers.name}',
                  style: const TextStyle(
                        fontFamily: 'avenir-roman',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      )
                  ),
                  const SizedBox(width: 5.0),
                Text('Courses: ${trainers.courses}',
                  style: const TextStyle(
                        fontFamily: 'avenir-roman',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      )
                  ),
              const SizedBox(width: 20,),
                IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TrainerScreen(title: 'course',);
                          },
                        ),
                      );
                    }),
                    const SizedBox(width: 5.0,),
                    IconButton(
                      icon: const Icon(Icons.delete_forever_outlined),
                      onPressed: () {
                        BlocProvider.of<TrainerCubit>(context).removeData(index);
                    })
                  ],
                ),          
              ],
            ),
          );
        }
      }