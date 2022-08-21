// ignore_for_file: sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'models/models.dart';

// ignore: public_member_api_docs
class GlintsTwitterAuth {
  // ignore: public_member_api_docs
  TwitterForGlintsFirebaseUser? currentUser;
  // ignore: public_member_api_docs
  bool get loggedIn => currentUser?.loggedIn ?? false;
  final FirebaseAuth _firebaseAuth;
  // ignore: public_member_api_docs
  GlintsTwitterAuth({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // ignore: public_member_api_docs
  Future<User?> signInWithEmail(String email, String password) async {
    // ignore: prefer_function_declarations_over_variables
    final signInFunc = () => _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(), password: password);
    return _signInOrCreateAccount(signInFunc);
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }


  // ignore: public_member_api_docs
  Future<User?> createAccountWithEmail(String email, String password) async {
    // ignore: prefer_function_declarations_over_variables
    final createAccountFunc = () =>
        _firebaseAuth.createUserWithEmailAndPassword(
            email: email.trim(), password: password);
    return _signInOrCreateAccount(createAccountFunc);
  }

  Future<User?> _signInOrCreateAccount(
      Future<UserCredential?> Function() signInFunc) async {
    try {
      final userCredential = await signInFunc();
      if (userCredential?.user != null) {
        await _maybeCreateUser(userCredential!.user!);
      }
      return userCredential?.user;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<void> _maybeCreateUser(User user) async {
    final userRecord = UsersRecord.collection.doc(user.uid);
    final userExists = await userRecord.get().then((u) => u.exists);
    if (userExists) {
      return;
    }
    final userData = createUsersRecordData(
      email: user.email,
      uid: user.uid,
      createdTime: DateTime.now(),
    );

    await userRecord.set(userData);
  }


  DocumentReference? get currentUserReference => currentUser?.user != null
      ? UsersRecord.collection.doc(currentUser!.user!.uid)
      : null;

  // ignore: lines_longer_than_80_chars, public_member_api_docs
  Stream<TwitterForGlintsFirebaseUser> twitterForGlintsFirebaseUserStream() =>
      _firebaseAuth
          .authStateChanges()
          .debounce(
            (user) => user == null && !loggedIn
                ? TimerStream(true, const Duration(seconds: 1))
                : Stream.value(user),
          )
          .map<TwitterForGlintsFirebaseUser>(
              (user) => currentUser = TwitterForGlintsFirebaseUser(user));
}

// ignore: public_member_api_docs
class TwitterForGlintsFirebaseUser {
  // ignore: public_member_api_docs
  const TwitterForGlintsFirebaseUser(this.user);
  final User? user;
   // ignore: public_member_api_docs
   bool get loggedIn => user != null;

  // ignore: public_member_api_docs
  static const empty =  TwitterForGlintsFirebaseUser(null);
}
