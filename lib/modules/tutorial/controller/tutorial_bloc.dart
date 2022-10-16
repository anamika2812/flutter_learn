import 'package:flutter_learn/bloc/bloc.dart';

import '../view/tutorial_list.dart';
import '../view_modal/tutorial_modal.dart';

class TutorialBloc extends Bloc<TutorialModel> {
  @override
  TutorialModel initDefaultValue() {
    return TutorialModel(0);
  }

  updateIndex(int index) {
    int length = TutorialList.list.length;
    int offset = index - 1000;
    int result = offset % length;
    state.index = result;
    emit(state);
  }
}
