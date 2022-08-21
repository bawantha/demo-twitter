import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required GlintsTwitterAuth glintsTwitterAuth})
      : _glintsTwitterAuth = glintsTwitterAuth,
        super(
          glintsTwitterAuth.currentUser != null
              ? glintsTwitterAuth.currentUser!.user == null
                  ? const AppState.unauthenticated()
                  : AppState.authenticated(glintsTwitterAuth.currentUser!)
              : const AppState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);

    _userSubscription =
        glintsTwitterAuth.twitterForGlintsFirebaseUserStream().listen(
              (user) => add(AppUserChanged(user)),
            );
  }

  final GlintsTwitterAuth _glintsTwitterAuth;
  late final StreamSubscription<TwitterForGlintsFirebaseUser> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.user != null
          ? AppState.authenticated(event.user,)
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_glintsTwitterAuth.signOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
