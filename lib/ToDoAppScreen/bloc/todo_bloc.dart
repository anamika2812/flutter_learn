import 'package:flutter_bloc/flutter_bloc.dart';
import 'repo/ITodo_repository.dart';
import 'repo/todo_repository.dart';
import 'todo_state.dart';

import '../models/todo.dart';

class TodoBloc extends Cubit<TodoState> {
  TodoBloc({ITodoRepository? todoRepository})
      : _todoRepository = todoRepository ?? TodoRepository(),
        super(TodoInitial());

  final ITodoRepository _todoRepository;

  Future<void> getAllTodo() async {
    emit(TodoLoading());
    final results = await _todoRepository.getAllTodos();
    emit(TodoSuccess(todos: results));
  }

  Future<void> addTodo(Todo todo) async {
    if (todo.todoText.isEmpty) return;
    emit(TodoLoading());
    await _todoRepository.addTodo(todo);
    final results = await _todoRepository.getAllTodos();
    emit(TodoSuccess(todos: results));
  }

  Future<void> removeTodo(Todo todo) async {
    emit(TodoLoading());
    await _todoRepository.removeTodo(todo);
    final results = await _todoRepository.getAllTodos();
    emit(TodoSuccess(todos: results));
  }
}
