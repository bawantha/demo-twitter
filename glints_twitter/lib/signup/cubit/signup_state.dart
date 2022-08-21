part of 'signup_cubit.dart';

enum SignupEvent {
  onInit,
  onValidateError,
  onSignup,
  onDismiss,
}

class SignupState extends Equatable {
  const SignupState(
      {this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.isPasswordVisible = false,
      this.errorMessage = '',
      this.event = SignupEvent.onInit});

  final String email;
  final String password;
  final String confirmPassword;
  final bool isPasswordVisible;
  final String errorMessage;
  final SignupEvent event;

  @override
  List<Object> get props => [
        email,
        password,
        confirmPassword,
        isPasswordVisible,
        errorMessage,
        event,
      ];

  /// create copyWith
  SignupState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    bool? isPasswordVisible,
    String? errorMessage,
    SignupEvent? event,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage ?? this.errorMessage,
      event: event ?? this.event,
    );
  }
}
