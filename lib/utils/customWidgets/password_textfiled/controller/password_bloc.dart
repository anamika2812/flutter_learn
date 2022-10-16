import 'package:flutter_learn/bloc/bloc.dart';
import 'package:flutter_learn/utils/customWidgets/password_textfiled/view_model/password_modal.dart';

class PasswordController extends Bloc<PasswordModel> {
  @override
  PasswordModel initDefaultValue() {
    return PasswordModel(true);
  }

  updateState() {
    state.passwordVisible = !state.passwordVisible;
    emit(state);
  }
}
