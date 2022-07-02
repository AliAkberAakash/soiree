import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SocialLoginController {

  final BehaviorSubject<UserCredential> _userCredentialController = BehaviorSubject();
  Stream<UserCredential> get userCredentialStream => _userCredentialController.stream;
  UserCredential? get userCredential => _userCredentialController.valueOrNull;

  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  SocialLoginController(){
    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });
  }

  Future<void> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithPopup(googleProvider);

    _userCredentialController.add(userCredential);
  }

}