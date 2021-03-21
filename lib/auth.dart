import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:your_plan_fitness/auth_service.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  return user;
}

Map<String, dynamic> _userData;
AccessToken _accessToken;
bool _checking = true;
final authService = AuthService();

Future<FirebaseUser> fbLogin() async {
  try {
    // show a circular progress indicator
    _accessToken = await FacebookAuth.instance
        .login(); // by the fault we request the email and the public profile
    // get the user data
    // by default we get the userId, email,name and picture
    final userData = await FacebookAuth.instance.getUserData();
    // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
    final AuthCredential authCredential =
        FacebookAuthProvider.getCredential(accessToken: _accessToken.token);
    final authResult = await authService.signInWithCredentail(authCredential);
    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(currentUser.uid == user.uid);
    _userData = userData;

    return user;
  } on FacebookAuthException catch (e) {
    // if the facebook login fails
    print(e.message); // print the error message in console
    // check the error type
    switch (e.errorCode) {
      case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
        print("You have a previous login operation in progress");
        break;
      case FacebookAuthErrorCode.CANCELLED:
        print("login cancelled");
        break;
      case FacebookAuthErrorCode.FAILED:
        print("login failed");
        break;
    }
  } catch (e, s) {
    // print in the logs the unknown errors
    print(e);
    print(s);
  } finally {
    // update the view
    print("oops");
  }
}

Future<void> fbLogout() async {
  await FacebookAuth.instance.logOut();
  _accessToken = null;
  _userData = null;
}

void signOutGoogle() async {
  await googleSignIn.signOut();
}

Future<FirebaseUser> signUpWithEmail(email, password) async {
  await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //have something that checks if creating a user with email and password was successful

  final AuthResult authResult =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  return user;
}

Future<FirebaseUser> loginWithEmail(email, password) async {
  final AuthResult authResult =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  return user;
}
