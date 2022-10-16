import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/bloc/bloc_builder.dart';

import '../../../helpers/validation.dart';
import '../controller/password_bloc.dart';

class PasswrdTextFiled extends StatelessWidget {
  PasswrdTextFiled(
      {super.key,
      required this.passwordController,
      required this.passwordFocus});

  final TextEditingController passwordController;
  final FocusNode passwordFocus;
  final PasswordController _passwordController = PasswordController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _passwordController, builder: () => _passwordTextForm());
  }

  Widget _passwordTextForm() {
    return TextFormField(
      cursorColor: Colors.redAccent,
      controller: passwordController,
      focusNode: passwordFocus,
      autofocus: false,
      obscureText: _passwordController.state.passwordVisible,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.passwordValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _passwordController.state.passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.red,
          ),
          onPressed: () {
            _passwordController.updateState();
          },
        ),
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 30.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
