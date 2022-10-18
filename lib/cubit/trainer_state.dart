import '../models/trainer.dart';
import 'package:equatable/equatable.dart';

class TrainerState extends Equatable {
  List<Trainer> list = [];

  TrainerState({
    required this.list,
  });

  TrainerState copyWith({List<Trainer>? list}) {
    return TrainerState(
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [list];
}
