import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_learn/bloc/bloc.dart';

import '../../../utils/customWidgets/custom_appstate.dart';
import '../../../utils/customWidgets/custom_responsemodal.dart';
import '../view_modal/http_modal.dart';

class HttpBloc extends Bloc<HttpModel> {
  @override
  HttpModel initDefaultValue() {
    return HttpModel(appState: AppState.inital);
  }

  updateState() async {
    state.appState = AppState.loding;
    emit(state);
    var data = await http.get(
      Uri.parse("https://list.ly/api/v4/meta?url=http://google.com"),
      headers: {'Content-Type': 'application/json'},
    );
    if (data.statusCode == 200) {
      state.appState = AppState.success;
      state.responseModel = ResponseModel(
        statusCode: data.statusCode.toString(),
        statusMessage: data.reasonPhrase.toString(),
        data: jsonDecode(data.body),
      );
    } else {
      state.appState = AppState.faliure;
    }

    emit(state);
    // return returnResponse;
  }
}
