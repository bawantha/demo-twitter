

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._glintsTwitterAuth) : super(const SignupState());

  final GlintsTwitterAuth _glintsTwitterAuth;

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void onTogglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void onSignup() {
    emit(state.copyWith(event: SignupEvent.onSignup));
  }

  void onDismiss() {
    emit(state.copyWith(event: SignupEvent.onDismiss));
  }

  bool _validatePassword() {
    if (state.password != state.confirmPassword) {
      emit(state.copyWith(errorMessage: 'Password does not match'));
      return false;
    } else {
      emit(
        state.copyWith(
          errorMessage: '',
        ),
      );
      return true;
    }
  }

  Future<void> signUpWithCredentials() async {
    try {
      if (_validatePassword()) {
        emit(state.copyWith(event: SignupEvent.onSignup));
        await _glintsTwitterAuth.createAccountWithEmail(
          state.email,
          state.password,
        );
        emit(state.copyWith(event: SignupEvent.onDismiss));
      } else {
        emit(state.copyWith(event: SignupEvent.onValidateError, errorMessage: 'Password does not match'));
      }
    } catch (e) {
      emit(
        state.copyWith(errorMessage: 'Unknown Error '),
      );
    }
  }
}
