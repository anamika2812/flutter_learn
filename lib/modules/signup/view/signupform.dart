import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/bloc/bloc_builder.dart';
import 'package:flutter_learn/modules/signup/controller/signup_bloc.dart';
import 'package:flutter_learn/modules/signup/view_modal/signup_modal.dart';
import 'package:flutter_learn/utils/customWidgets/password_textfiled/view/password_textfiled.dart';
import 'package:flutter_learn/utils/customWidgets/snackbar_screen.dart';
import 'package:flutter_learn/utils/helpers/app_routes.dart';
import 'package:flutter_learn/utils/helpers/validation.dart';
import 'package:flutter_learn/utils/helpers/app_const.dart';

import '../../../utils/helpers/app_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isSignIn = false;
  bool google = false;
  String? dropdownvalue;
  final SignupBloc _signupBloc = SignupBloc();

  var items = [
    '+91',
    '+90',
    '+1064',
    '+1020',
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool isLoading = false;

  _returnErrorText() {
    bool isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Success"),
      ));
    }
  }

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _phoneNNumberFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 106, 57, 53),
        title: const Text(
          AppConst.headingtext,
          style: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 80,
          left: 30,
          right: 30,
          bottom: 10,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _titleText(),
              _sizedBox(),
              _descriptionText(),
              _sizedBox(),
              _nameTextForm(),
              _sizedBox(),
              _emailTextForm(),
              _sizedBox(),
              _phoneNoTextform(),
              _sizedBox(),
              PasswrdTextFiled(
                passwordController: _passwordController,
                passwordFocus: _passwordFocus,
              ),
              _sizedBox(),
              _submitButton(),
              _sizedBox(),
              _buildBuilder()
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleText() {
    return const Text(
      AppConst.titletext,
      style: AppStyle.titlestyle,
      textAlign: TextAlign.center,
    );
  }

  Widget _sizedBox() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _descriptionText() {
    return const Text(
      AppConst.dummytext,
      style: TextStyle(fontSize: 14.0, color: Colors.black87),
      textAlign: TextAlign.center,
    );
  }

  Widget _nameTextForm() {
    return TextFormField(
      cursorColor: Colors.redAccent,
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: _nameController,
      focusNode: _firstNameFocus,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.nameValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
        FilteringTextInputFormatter.allow(
          RegExp(r'[A-Za-z ]'),
        )
      ],
      decoration: InputDecoration(
        hintText: 'Name',
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

  Widget _emailTextForm() {
    return TextFormField(
      cursorColor: Colors.redAccent,
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      controller: _emailController,
      focusNode: _emailFocus,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.emailValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(
          RegExp(r'[A-Za-z0-9@._]'),
        )
      ],
      decoration: InputDecoration(
        hintText: 'Email',
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

  Widget _phoneNoTextform() {
    return TextFormField(
      cursorColor: Colors.redAccent,
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: _phoneController,
      focusNode: _phoneNNumberFocus,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.phoneNumberValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(
          RegExp(r'[0-9]'),
        )
      ],
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsetsDirectional.only(start: 25.0),
          child: Icon(
            Icons.arrow_drop_down,
            color: Colors.red,
            size: 40,
          ),
        ),
        hintText: 'Phone Number',
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

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: () {
          _returnErrorText();
        },
        style: AppStyle.signupButtonStyle,
        child: const Text(
          AppConst.signup,
          style: AppStyle.buttonsignup,
        ));
  }

  _navigateOnProfile() {
    Navigator.pushNamed(context, AppRoutes.profilehomescreen,
        arguments: _signupBloc.state.responseModel?.data);
  }

  Widget _googleButton() {
    return ElevatedButton(
      onPressed: () async {
        await _signupBloc.goggleLogin();
        if (_signupBloc.state.appState == AppState.success) {
          if (!_signupBloc.state.responseModel?.data['isNewUser']) {
            _navigateOnProfile();
          }
        } else {
          AppSnackBar.showSnackBar(
            context: context,
            message: _signupBloc.state.responseModel?.statusMessage ?? "",
          );
        }
      },
      style: AppStyle.signupButtonStyle,
      child: _signupBloc.state.appState == AppState.loding
          ? const CircularProgressIndicator()
          : const Text(
              AppConst.login,
              style: AppStyle.buttonsignup,
            ),
    );
  }

  Widget _buildBuilder() {
    return BlocBuilder(
      builder: () {
        return _googleButton();
      },
      bloc: _signupBloc,
    );
  }
}
