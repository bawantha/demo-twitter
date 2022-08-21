import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';
import 'package:glints_twitter/login/cubit/login_cubit.dart';
import 'package:glints_twitter/login/login.dart';
import 'package:glints_twitter/signup/view/sign_up_view.dart';
import 'package:glints_twitter/utills/glints_twitter_theme.dart';

import 'package:glints_twitter/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        context.read<GlintsTwitterAuth>(),
      ),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlintsTwitterTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.twitter,
                color: GlintsTwitterTheme.of(context).secondaryColor,
                size: 34,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Text(
                  'Login to Twitter',
                  style: GlintsTwitterTheme.of(context).bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: GlintsTwitterTheme.of(context).bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    filled: true,
                    fillColor: GlintsTwitterTheme.of(context).lineColor,
                  ),
                  style: GlintsTwitterTheme.of(context).bodyText1,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: context.read<LoginCubit>().onEmailChanged,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      onChanged: context.read<LoginCubit>().onPasswordChanged,
                      obscureText:
                          context.read<LoginCubit>().state.isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: GlintsTwitterTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        filled: true,
                        fillColor: GlintsTwitterTheme.of(context).lineColor,
                        suffixIcon: InkWell(
                          onTap: context
                              .read<LoginCubit>()
                              .onTogglePasswordVisibility,
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            context.read<LoginCubit>().state.isPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: GlintsTwitterTheme.of(context).bodyText1,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: GlintsTwitterTheme.of(context).secondaryBackground,
                  ),
                  child: GTButtonWidget(
                    onPressed: context.read<LoginCubit>().logInWithCredentials,
                    text: 'Login',
                    options: GTButtonOptions(
                      width: 130,
                      height: double.infinity,
                      color: GlintsTwitterTheme.of(context).primaryColor,
                      textStyle: GlintsTwitterTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily:
                                GlintsTwitterTheme.of(context).subtitle2Family,
                            color: Colors.white,
                          ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Forget password',
                    style: GlintsTwitterTheme.of(context).bodyText1,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push<void>(
                      SignUpPage.route(),
                    ),
                    child: Text(
                      'Sign up for Twitter',
                      style: GlintsTwitterTheme.of(context).bodyText1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
