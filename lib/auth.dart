import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
