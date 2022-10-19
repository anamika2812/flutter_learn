import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_learn/bloc/bloc.dart';

import '../../../utils/customWidgets/custom_appstate.dart';
import '../../../utils/customWidgets/custom_responsemodal.dart';

import '../view_modal/list_modal.dart';

class ListBloc extends Bloc<Listmodel> {
  @override
  Listmodel initDefaultValue() {
    return Listmodel(appState: AppState.inital);
  }

  updateState() async {
    state.appState = AppState.loding;
    emit(state);
    var data = await http.get(
      Uri.parse("https://date.nager.at/api/v2/publicholidays/2020/US"),
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
