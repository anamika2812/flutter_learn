import 'package:flutter/material.dart';

import 'package:flutter_learn/utils/helpers/app_color.dart';

import '../../../bloc/bloc_builder.dart';
import '../../../utils/customWidgets/custom_appstate.dart';
import '../../../utils/helpers/app_dimension.dart';
import '../controller/http_bloc.dart';

class DemoHttpScreen extends StatefulWidget {
  const DemoHttpScreen({super.key});

  @override
  State<DemoHttpScreen> createState() => _DemoHttpScreenState();
}

class _DemoHttpScreenState extends State<DemoHttpScreen> {
  final HttpBloc _httpBloc = HttpBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _httpBloc,
      builder: () {
        return Scaffold(
          backgroundColor: AppColors.grey,
          body: Column(
            children: [
              _sizebox(),
              const Text(
                'Image',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              _httpBloc.state.responseModel?.data['metadata']['images'][0] !=
                      null
                  ? Image.network(
                      _httpBloc.state.responseModel?.data['metadata']['images']
                          [0],
                      width: MediaQuery.of(context).size.width,
                    )
                  : Image.network(
                      'https://picsum.photos/id/1074/400/400',
                      width: 100,
                    ),
              _sizebox(),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                _httpBloc.state.responseModel?.data['metadata']['name'] ?? '',
                style: const TextStyle(
                    fontSize: AppDim.size18,
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
              _sizebox(),
              const Text('Description',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  )),
              Text(
                _httpBloc.state.responseModel?.data['metadata']
                        ['description'] ??
                    '',
                style: const TextStyle(
                    fontSize: AppDim.size18,
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              _sizebox(),
              const Text('URL',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  )),
              Text(
                _httpBloc.state.responseModel?.data['metadata']['url'] ?? '',
                style: const TextStyle(
                    fontSize: AppDim.size18,
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
              _sizebox(),
              _httpBloc.state.appState == AppState.loding
                  ? const CircularProgressIndicator(
                      color: AppColors.red,
                    )
                  : ElevatedButton(
                      child: const Text("btn Demo"),
                      onPressed: () {
                        _httpBloc.updateState();
                      }),
            ],
          ),
        );
      },
    );
  }

  _sizebox() {
    return const SizedBox(
      height: 60,
    );
  }
}
