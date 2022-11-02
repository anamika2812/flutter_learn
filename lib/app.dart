// import 'package:flutter/material.dart';
// import 'package:flutter_learn/utils/helpers/app_const.dart';
// import 'package:flutter_learn/utils/helpers/app_routes.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: AppConst.demotilte,
//       theme: ThemeData(
//         useMaterial3: true,
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: AppRoutes.todohomescreen,
//       routes: AppRoutes.getRoutes(),
//       // home: const ScreenoneDemo(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ToDoAppScreen/bloc/todo_bloc.dart';
import 'ToDoAppScreen/view/home/home_view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoBloc()..getAllTodo(),
        child: HomeView(),
      ),
    );
  }
}
