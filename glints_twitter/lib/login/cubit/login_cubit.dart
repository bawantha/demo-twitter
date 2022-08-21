import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._glintsTwitterAuth)
      : super(
          const LoginState(email: '', password: '', isPasswordVisible: true),
        );
  final GlintsTwitterAuth _glintsTwitterAuth;

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void onTogglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> logInWithCredentials() async {
    try {
      await _glintsTwitterAuth.signInWithEmail(state.email, state.password);
    } catch (e) {
      print(e);
    }
  }
}
