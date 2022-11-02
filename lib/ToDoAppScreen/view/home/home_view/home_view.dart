import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/utils/helpers/app_color.dart';
import 'package:flutter_learn/utils/helpers/app_const.dart';
import 'package:kartal/kartal.dart';
import '../../../bloc/todo_bloc.dart';
import '../../../bloc/todo_state.dart';
import '../../../models/todo.dart';
import '../../../product/cards/todo_card.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "TODO LIST",
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: _todoTextField(context),
              ),
              _addTodoButton(context),
              Expanded(
                flex: 9,
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state is TodoLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is TodoInitial) {
                      return const Center(child: Text(AppConst.initialText));
                    } else if (state is TodoSuccess) {
                      var todoList = state.todos ?? dummyList;

                      return ListView.builder(
                        itemCount: todoList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TodoCard(todo: todoList[index]);
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                            (state as TodoError).error ?? AppConst.errorText),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addTodoButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.read<TodoBloc>().addTodo(Todo(
            todoText: _controller.text.trim(), createdAt: Timestamp.now()));
        _controller.text = '';
      },
      label: Text(
        AppConst.addTodo,
        style: TextStyle(
          color: Colors.blueGrey[900],
        ),
      ),
      icon: Icon(
        Icons.add,
        color: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.white,
    );
  }

  _todoTextField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
      controller: _controller,
      style: context.textTheme.titleLarge,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 8, bottom: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.green,
            width: 3,
          ),
        ),
      ),
    );
  }
}
