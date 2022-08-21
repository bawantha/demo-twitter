import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';
import 'package:glints_twitter/signup/cubit/signup_cubit.dart';
import 'package:glints_twitter/utills/glints_twitter_theme.dart';
import 'package:glints_twitter/widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(
        context.read<GlintsTwitterAuth>(),
      ),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlintsTwitterTheme.of(context).primaryBackground,
      body: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state.event == SignupEvent.onDismiss) {
            Navigator.of(context).pop();
          } else if (state.event == SignupEvent.onValidateError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
          }
        },
        child: SafeArea(
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
                    'Sign up to Twitter',
                    style: GlintsTwitterTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: TextFormField(
                    onChanged: context.read<SignupCubit>().onEmailChanged,
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      // ignore: lines_longer_than_80_chars
                      return TextFormField(
                        onChanged:
                            context.read<SignupCubit>().onPasswordChanged,
                        obscureText:
                            context.read<SignupCubit>().state.isPasswordVisible,
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
                                .read<SignupCubit>()
                                .onTogglePasswordVisibility,
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              context
                                      .read<SignupCubit>()
                                      .state
                                      .isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFF757575),
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
                  child: TextFormField(
                    onChanged:
                        context.read<SignupCubit>().onConfirmPasswordChanged,
                    obscureText:
                        context.read<SignupCubit>().state.isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
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
                            .read<SignupCubit>()
                            .onTogglePasswordVisibility,
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          context.read<SignupCubit>().state.isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: GlintsTwitterTheme.of(context).bodyText1,
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
                      onPressed:
                          context.read<SignupCubit>().signUpWithCredentials,
                      text: 'Sign up',
                      options: GTButtonOptions(
                        width: 130,
                        height: double.infinity,
                        color: GlintsTwitterTheme.of(context).primaryColor,
                        textStyle:
                            GlintsTwitterTheme.of(context).subtitle2.override(
                                  fontFamily: GlintsTwitterTheme.of(context)
                                      .subtitle2Family,
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
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'back',
                        style: GlintsTwitterTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
