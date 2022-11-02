import '../../../utils/helpers/app_const.dart';
import 'ITodo_repository.dart';
import '../../models/todo.dart';

class TodoRepository extends ITodoRepository {
  @override
  Future<List<Todo>> getAllTodos() async {
    List<Todo> todos = [];
    final results = await firestore
        .collection(AppConst.collectionPath)
        .orderBy(AppConst.orderField)
        .get();
    for (var snapshot in results.docs) {
      Todo newTodo = Todo.fromJson(snapshot.data());
      newTodo.id = snapshot.id;
      todos.add(newTodo);
    }
    return todos;
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await firestore.collection(AppConst.collectionPath).add(todo.toJson());
  }

  @override
  Future<void> removeTodo(Todo todo) async {
    await firestore.collection(AppConst.collectionPath).doc(todo.id).delete();
  }
}
