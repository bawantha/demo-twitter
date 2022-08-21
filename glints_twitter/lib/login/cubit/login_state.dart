part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState(
      {required this.email,
      required this.password,
      required this.isPasswordVisible});
  final String email;
  final String password;
  final bool isPasswordVisible;

  @override
  List<Object?> get props =>
      [email, password, isPasswordVisible];

  /// creat copyWith method to create new instance of [LoginState]
  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,rr
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
