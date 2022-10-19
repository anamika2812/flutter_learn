import 'package:flutter/material.dart';
import '../../../bloc/bloc_builder.dart';
import '../../../utils/customWidgets/custom_appstate.dart';

import '../../../utils/helpers/app_color.dart';
import '../../../utils/helpers/app_dimension.dart';
import '../controller/list_bloc.dart';

class ListHttpDemo extends StatefulWidget {
  const ListHttpDemo({super.key});

  @override
  State<ListHttpDemo> createState() => _ListHttpDemoState();
}

class _ListHttpDemoState extends State<ListHttpDemo> {
  final ListBloc _listBloc = ListBloc();

  @override
  void initState() {
    super.initState();
    _listBloc.updateState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _listBloc,
      builder: () {
        return Scaffold(
          backgroundColor: AppColors.grey,
          body: Center(
            child: _listBloc.state.appState == AppState.loding
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _listBloc.state.responseModel?.data[index]
                                    ['name'] ??
                                '',
                            style: const TextStyle(
                                fontSize: AppDim.size18,
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: AppColors.black.withOpacity(0.2),
                          ),
                          Text(
                            _listBloc.state.responseModel?.data[index]
                                    ['date'] ??
                                '',
                            style: const TextStyle(
                                fontSize: AppDim.size18,
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                    itemCount: _listBloc.state.responseModel?.data.length,
                  ),
          ),
        );
      },
    );
  }
}
