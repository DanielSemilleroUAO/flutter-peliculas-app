import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/firebase_auth.dart';

class AuthRepository {

  final _firebaseAuthAPI = FirebaseAuthApi();

  Future<FirebaseUser> singInFirebase () => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();

}