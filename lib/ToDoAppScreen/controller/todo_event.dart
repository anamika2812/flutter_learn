import '../model/todo_dto.dart';

abstract class TodoEvent {
  TodoEvent();
}

class GetAllTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  TodoDTO todo;
  AddTodo(
    this.todo,
  );
}

class UpdateTodo extends TodoEvent {
  TodoDTO todo;
  UpdateTodo(
    this.todo,
  );
}

class DeleteTodo extends TodoEvent {
  TodoDTO todo;
  DeleteTodo(
    this.todo,
  );
}
