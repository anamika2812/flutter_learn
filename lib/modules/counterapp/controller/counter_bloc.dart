import 'package:flutter_learn/bloc/bloc.dart';
import '../view_modal/counter_modal.dart';

class CounterBloc extends Bloc<CounterModel> {
  @override
  CounterModel initDefaultValue() {
    return CounterModel(0);
  }

  updateIndexCounter() {
    state.incrementindex++;
    emit(state);
  }
}
