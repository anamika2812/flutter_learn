import 'package:flutter_learn/bloc/bloc.dart';
import 'package:flutter_learn/modules/signup/view_modal/signup_modal.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/customWidgets/custom_appstate.dart';
import '../../../utils/customWidgets/custom_responsemodal.dart';

class SignupBloc extends Bloc<SignupModel> {
  @override
  SignupModel initDefaultValue() {
    return SignupModel(appState: AppState.inital);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> goggleLogin() async {
    state.appState = AppState.loding;
    emit(state);
    try {
      final GoogleSignInAccount? goggleUser = await GoogleSignIn().signIn();
      if (goggleUser == null) {
        state.appState = AppState.faliure;
        state.responseModel = ResponseModel(
          statusCode: "500",
          statusMessage: "user has canceled",
        );
      } else {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await goggleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        UserCredential result = await auth.signInWithCredential(credential);

        state.appState = AppState.success;
        state.responseModel = ResponseModel(
          statusCode: "200",
          statusMessage: "sucess",
          data: {
            "profile": goggleUser.photoUrl,
            "name": goggleUser.displayName,
            "email": goggleUser.email,
            'isNewUser': result.additionalUserInfo?.isNewUser,
          },
        );
        await GoogleSignIn().signOut();
      }
    } catch (e) {
      state.appState = AppState.faliure;
      state.responseModel = ResponseModel(
        statusCode: "500",
        statusMessage: e.toString(),
      );
    }

    emit(state);
  }
}
