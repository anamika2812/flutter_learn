import '../../../utils/customWidgets/custom_appstate.dart';
import '../../../utils/customWidgets/custom_responsemodal.dart';

class SignupModel {
  AppState appState;
  ResponseModel? responseModel;
  SignupModel({
    required this.appState,
    this.responseModel,
  });
}
