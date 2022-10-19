import '../../../utils/customWidgets/custom_appstate.dart';
import '../../../utils/customWidgets/custom_responsemodal.dart';

class Listmodel {
  AppState appState;
  ResponseModel? responseModel;
  Listmodel({
    required this.appState,
    this.responseModel,
  });
}
