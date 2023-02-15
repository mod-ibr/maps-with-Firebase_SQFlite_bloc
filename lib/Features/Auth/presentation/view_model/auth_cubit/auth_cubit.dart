import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  FirebaseAuth auth = FirebaseAuth.instance;
  late String verificationId;

  Future<void> submitPhoneNumber({required String completedPhoneNumber}) async {
    ///This Functin will pass to verify button of phone Auth Page to take the completed phone number with city code
    ///and verify that number by sending OTP code by SMS

    // Loading
    emit(LoadingState());
    // Start verifying Phone Number
    await auth.verifyPhoneNumber(
      phoneNumber: completedPhoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  verificationCompleted(PhoneAuthCredential credential) async {
    /// This handler will only be called on Android devices which support automatic SMS code resolution.
    /// After gitting code Automatically then sign in,if not so run submitOTp function after gitting the code manually.

    print('Verification Completed');
    await auth.signInWithCredential(credential);
  }

  verificationFailed(FirebaseAuthException e) {
    // Error during Verification
    if (e.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
      emit(ErrorState(errorMessage: 'The provided phone number is not valid.'));
    } else {
      print('Error during Verification :${e.code}');
      emit(ErrorState(errorMessage: e.code.toString()));
    }
  }

  codeSent(String verificationId, int? resendToken) async {
    this.verificationId = verificationId;
    print('Code Sent');
    emit(PhoneNumberSubmittedState());
  }

  codeAutoRetrievalTimeout(String verificationId) {
    print('code Auto Retrieval Timeout');
  }

  Future<void> submitOTp({required String otpCode}) async {
    /// This Function wil pass to verify button for OTP page to take OTP code and verify it

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: otpCode);
    try {
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      emit(OTPVerifiedState());
    } catch (e) {
      emit(ErrorState(errorMessage: 'Error During submitting your code, $e'));
    }
  }

  Future<void> logOut() async {
    emit(LoadingState());
    await auth.signOut();
  }

  User currentUser() {
    return auth.currentUser!;
  }
}
