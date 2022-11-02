import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/utils/helpers/app_color.dart';
import '../../bloc/todo_bloc.dart';
import '../../models/todo.dart';
import 'package:kartal/kartal.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key, required this.todo}) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        context.read<TodoBloc>().removeTodo(todo);
      },
      direction: DismissDirection.endToStart,
      child: Card(
        color: AppColors.lightgreen,
        child: Padding(
          padding: context.paddingNormal,
          child: Text(
            todo.todoText,
            style: context.textTheme.headline4?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
