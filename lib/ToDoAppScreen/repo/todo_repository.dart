import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../utils/helpers/app_const.dart';
import '../../../utils/helpers/response_helper.dart';
import '../model/todo_dto.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ITodoRepository {
  Future<FirebaseResponse<List<TodoDTO>>> getAllTodos();
  Future<FirebaseResponse<Unit>> addTodo(TodoDTO todo);
  Future<FirebaseResponse<Unit>> updateTodo(TodoDTO todo);
  Future<FirebaseResponse<Unit>> removeTodo(TodoDTO todo);
}

class TodoRepository implements ITodoRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<FirebaseResponse<List<TodoDTO>>> getAllTodos() async {
    try {
      List<TodoDTO> todos = [];
      final results = await firestore
          .collection(AppConst.collectionPath)
          .orderBy(AppConst.orderField)
          .get();
      for (final snapshot in results.docs) {
        TodoDTO newTodo = TodoDTO.fromJson(snapshot.data());
        newTodo.id = snapshot.id;
        todos.add(newTodo);
      }
      return right(todos);
    } catch (e) {
      log('An error occured $e');
      rethrow;
    }
  }

  @override
  Future<FirebaseResponse<Unit>> addTodo(TodoDTO todo) async {
    try {
      await firestore.collection(AppConst.collectionPath).add(todo.toMap());

      return right(unit);
    } catch (e) {
      log('An error occured $e');
      rethrow;
    }
  }

  @override
  Future<FirebaseResponse<Unit>> updateTodo(TodoDTO todo) async {
    try {
      await firestore
          .collection(AppConst.collectionPath)
          .doc(todo.id)
          .update(todo.toMap());

      return right(unit);
    } catch (e) {
      log('An error occured $e');
      rethrow;
    }
  }

  @override
  Future<FirebaseResponse<Unit>> removeTodo(TodoDTO todo) async {
    try {
      await firestore.collection(AppConst.collectionPath).doc(todo.id).delete();

      return right(unit);
    } catch (e) {
      log('An error occured $e');
      rethrow;
    }
  }
}
