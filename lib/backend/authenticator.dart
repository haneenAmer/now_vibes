import 'package:firebase_auth/firebase_auth.dart';
import 'package:now_vibes/posts/user_id.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:now_vibes/state-auth/auth_results.dart';
import 'package:now_vibes/state-auth/constant.dart';

/// it is just a functions called some functions it has no state

class Authenticator {
  const Authenticator();

  /// if you have userid so you are logged in
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  String? get email => FirebaseAuth.instance.currentUser?.email;

  /// sign out from 3 diffrient places ( FirebaseAuth, Face book , google  )
  Future<AuthResult> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
// WARNING
    return AuthResult.failure;
  }

  Future<AuthResult> loginWithFacebook() async {
    // try {
    final loginResult = await FacebookAuth.instance.login();
    final token = loginResult.accessToken?.token;
    if (token == null) {
      //user has aborted the logginig in process
      return AuthResult.aborted;
    }

    final oauthCredentials = FacebookAuthProvider.credential(token);
    try {
      await FirebaseAuth.instance.signInWithCredential(oauthCredentials);
      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      /// if the user try to login with google and then log out and try to login
      /// with facebook with same email firebase will prevent that
      final email = e.email;
      final credential = e.credential;
      if (e.code == Constants.accountExistsWithDifferetnCredential &&
          email != null &&
          credential != null) {
        final providers =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
        if (providers.contains(Constants.googleCom)) {
          await loginWithGoogle();
          FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
        }
        return AuthResult.success;
      }
      return AuthResult.failure;
    }
    //}
    // catch (e) {
    //   return AuthResult.failure;
    // }
  }

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn =
        GoogleSignIn(scopes: [Constants.emailScop]);
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      AuthResult.aborted;
    }
    final googleAuth = await signInAccount?.authentication;
    final oauthcredentials = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(oauthcredentials);
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
