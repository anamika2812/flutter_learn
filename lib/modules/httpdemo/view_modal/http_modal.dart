import '../../../utils/customWidgets/custom_appstate.dart';
import '../../../utils/customWidgets/custom_responsemodal.dart';

class HttpModel {
  AppState appState;
  ResponseModel? responseModel;
  HttpModel({
    required this.appState,
    this.responseModel,
  });
}
