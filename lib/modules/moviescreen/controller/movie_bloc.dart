import 'package:flutter_learn/bloc/bloc.dart';
import '../view_model/movie_modal.dart';

class MovieBuzzBloc extends Bloc<MovieBuzzModel> {
  @override
  MovieBuzzModel initDefaultValue() {
    return MovieBuzzModel(0);
  }

  updateIndex(int currentIndex) {
    state.selectedIndex = currentIndex;
    emit(state);
  }
}
