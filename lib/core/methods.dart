//*utils
import '../../utils/utils.dart';

//*signin
Future<bool> signIn(BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    VxToast.show(
      context,
      msg: 'Loading...',
      position: VxToastPosition.top,
    );
    return true;
  } catch (e) {
    VxToast.show(
      context,
      msg: "Error: Try again",
      position: VxToastPosition.top,
    );
    return false;
  }
}

//*register
Future<bool> register(
    BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    VxToast.show(
      context,
      msg: 'Loading...',
      position: VxToastPosition.top,
    );

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      VxToast.show(
        context,
        msg: "Password Provided is too weak",
        position: VxToastPosition.top,
      );
    } else if (e.code == 'email-already-in-use') {
      VxToast.show(
        context,
        msg: "Email already in use",
        position: VxToastPosition.top,
      );
    } else {
      VxToast.show(
        context,
        msg: "Error: Try again",
        position: VxToastPosition.top,
      );
    }

    return false;
  } catch (e) {
    VxToast.show(
      context,
      msg: "Error: Try again",
      position: VxToastPosition.top,
    );
  }
  return false;
}
