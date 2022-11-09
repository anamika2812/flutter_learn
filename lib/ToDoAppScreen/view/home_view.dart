import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/helpers/app_color.dart';
import '../../../utils/helpers/app_const.dart';
import '../../../utils/helpers/app_dimension.dart';
import '../controller/todo_bloc.dart';
import '../controller/todo_event.dart';
import '../controller/todo_state.dart';
import '../model/todo_dto.dart';
import 'widgets/todo_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(GetAllTodos()),
      child: const HomeViewUI(),
    );
  }
}

class HomeViewUI extends StatefulWidget {
  const HomeViewUI({Key? key}) : super(key: key);

  @override
  State<HomeViewUI> createState() => _HomeViewUIState();
}

class _HomeViewUIState extends State<HomeViewUI> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _textFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          AppConst.appBarName,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: AppDim.size25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _todoTextField(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      var todo = state.todoList;

                      if (todo.isEmpty) {
                        return const Center(child: Text(AppConst.errorText));
                      } else {
                        return TodoCard(todo: todo);
                      }
                    }
                  },
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  context.read<TodoBloc>().add(AddTodo(TodoDTO(
                      todoText: _controller.text.trim(),
                      createdAt: Timestamp.now())));
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _todoTextField(BuildContext context) {
    return TextField(
      cursorColor: Colors.white12,
      autofocus: false,
      focusNode: _textFocus,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
      controller: _controller,
      decoration: InputDecoration(
        hintText: AppConst.writetodos,
        hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
        contentPadding: const EdgeInsets.only(left: 8, bottom: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.green,
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
