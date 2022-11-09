import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/helpers/app_color.dart';
import '../../../../utils/helpers/app_const.dart';
import '../../../../utils/helpers/app_dimension.dart';
import '../../controller/todo_bloc.dart';
import '../../controller/todo_event.dart';
import '../../model/todo_dto.dart';

class TodoCard extends StatelessWidget {
  TodoCard({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final List<TodoDTO> todo;
  final TextEditingController controller = TextEditingController();

  updateTodo(BuildContext context, String? id) async {
    context.read<TodoBloc>().add(UpdateTodo(
          TodoDTO(
            id: id,
            todoText: controller.text.trim(),
            createdAt: Timestamp.now(),
          ),
        ));

    controller.text = '';
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return Dismissible(
          key: Key(index.toString()),
          onDismissed: (direction) {
            context.read<TodoBloc>().add(
                  DeleteTodo(
                    todo[index],
                  ),
                );
          },
          direction: DismissDirection.endToStart,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(AppColors.lightgreen),
            ),

            //   onPressed: () {
            //   showDialog(
            //       context: context,
            //       builder: (mContext) {
            //         return CustomAlertBox(
            //           mContext: context,
            //           todo: todo,
            //           index: index,
            //         );
            //       });
            // },

            onPressed: () {
              showDialog(
                  context: context,
                  builder: (mContext) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppDim.size20),
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(top: AppDim.size10),
                      title: Text(
                        todo[index].todoText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: AppDim.size25),
                      ),
                      content: SizedBox(
                        height: AppDim.size300,
                        width: AppDim.size600,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextField(
                                cursorColor: Colors.white10,
                                autofocus: false,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 5,
                                controller: controller,
                                decoration: InputDecoration(
                                  hintText: AppConst.edittodos,
                                  hintStyle: const TextStyle(
                                      fontSize: AppDim.size12,
                                      color: Colors.redAccent),
                                  contentPadding:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: AppColors.black,
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
                              ),
                            ),
                            const SizedBox(
                              height: AppDim.size180,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FloatingActionButton.extended(
                                    onPressed: () {
                                      updateTodo(context, todo[index].id);
                                    },
                                    label: Text(
                                      AppConst.editTodo,
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                      ),
                                    ),
                                    icon: Icon(
                                      Icons.save,
                                      color: Colors.blueGrey[900],
                                    ),
                                    backgroundColor: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(AppDim.size8),
              child: Text(
                todo[index].todoText,
              ),
            ),
          ),
        );
      },
      itemCount: todo.length,
    );
  }
}
