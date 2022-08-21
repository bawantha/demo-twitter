part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    this.currentUserReference,
    this.currentUserEmail,
    required this.status,
    this.user = TwitterForGlintsFirebaseUser.empty,
  });

  AppState.authenticated(TwitterForGlintsFirebaseUser user)
      : this._(
          status: AppStatus.authenticated,
          user: user,
          currentUserReference: TweetsRecord.collection.doc(user.user!.uid),
          currentUserEmail: user.user!.email,
        );

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final TwitterForGlintsFirebaseUser user;
  final DocumentReference? currentUserReference;
  final String? currentUserEmail;

  @override
  List<Object?> get props =>
      [status, user, currentUserReference, currentUserEmail];
}
