import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class JOBIstaFirebaseUser {
  JOBIstaFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

JOBIstaFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<JOBIstaFirebaseUser> jOBIstaFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<JOBIstaFirebaseUser>(
        (user) => currentUser = JOBIstaFirebaseUser(user));
