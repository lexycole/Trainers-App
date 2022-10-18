import 'package:bloc/bloc.dart';
import '../models/trainer.dart';
import '../cubit/trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerState(list: const []));

  void addTrainers(Trainer trainers) {
    List<Trainer> _listTrainers = List.from(state.list);
    _listTrainers.add(trainers);
    emit(state.copyWith(list: _listTrainers));
  }

  void removeData(int index) {
    List<Trainer> list_trainers = List.from(state.list);
    list_trainers.removeAt(index);
    emit(state.copyWith(list: list_trainers));
  }
}
