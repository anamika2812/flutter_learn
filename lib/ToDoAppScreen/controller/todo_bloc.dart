import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/todo_repository.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<GetAllTodos>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await TodoRepository().getAllTodos();
      final updatedState = result.fold(
        (l) => state.copyWith(isLoading: false),
        (r) => state.copyWith(
          isLoading: false,
          todoList: r,
        ),
      );
      emit(updatedState);
    });

    on<AddTodo>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await TodoRepository().addTodo(event.todo);
      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
        ),
        (r) {
          add(GetAllTodos());
          return state.copyWith(
            isLoading: false,
          );
        },
      );
      emit(updatedState);
    });

    on<UpdateTodo>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await TodoRepository().updateTodo(event.todo);
      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
        ),
        (r) {
          add(GetAllTodos());
          return state.copyWith(
            isLoading: false,
          );
        },
      );
      emit(updatedState);
    });

    on<DeleteTodo>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await TodoRepository().removeTodo(event.todo);
      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
        ),
        (r) {
          add(GetAllTodos());
          return state.copyWith(
            isLoading: false,
          );
        },
      );
      emit(updatedState);
    });
  }
}
