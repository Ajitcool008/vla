import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../helpers/app_snackbar.dart';
import '../views/verify_otp_screen.dart';

class AuthController extends GetxController {

   TextEditingController editingControllerOTP1 = TextEditingController();
  TextEditingController editingControllerOTP2 = TextEditingController();
  TextEditingController editingControllerOTP3 = TextEditingController();
  TextEditingController editingControllerOTP4 = TextEditingController();
  TextEditingController editingControllerOTP5 = TextEditingController();
  TextEditingController editingControllerOTP6 = TextEditingController();
  final FocusNode pin1FocusNode = FocusNode();
  final FocusNode pin2FocusNode = FocusNode();
  final FocusNode pin3FocusNode = FocusNode();
  final FocusNode pin4FocusNode = FocusNode();
  final FocusNode pin5FocusNode = FocusNode();
  final FocusNode pin6FocusNode = FocusNode();

  RxBool isOtpTimeCompleted = false.obs;
  RxBool resend = false.obs;
  RxBool isStartTypingOtp1 = false.obs; //for otp box color
  RxBool isStartTypingOtp2 = false.obs; //for otp box color
  RxBool isStartTypingOtp3 = false.obs; //for otp box color
  RxBool isStartTypingOtp4 = false.obs; //for otp box color
  RxBool isStartTypingOtp5 = false.obs; //for otp box color
  RxBool isStartTypingOtp6 = false.obs; //for otp box color
  static String receivedVerificationId = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static bool isForgotPasswordFlow = false;
  bool isUnderProgress = false;


RxBool visible = true.obs;
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();



//changing color of otp box
  void changeOtpboxColor1({required bool isWhite}) {
    isStartTypingOtp1.value = isWhite;
  }

  void changeOtpboxColor2({required bool isWhite}) {
    isStartTypingOtp2.value = isWhite;
  }

  void changeOtpboxColor3({required bool isWhite}) {
    isStartTypingOtp3.value = isWhite;
  }

  void changeOtpboxColor4({required bool isWhite}) {
    isStartTypingOtp4.value = isWhite;
  }

  void changeOtpboxColor5({required bool isWhite}) {
    isStartTypingOtp5.value = isWhite;
  }

  void changeOtpboxColor6({required bool isWhite}) {
    isStartTypingOtp6.value = isWhite;
  }



  void nexField({required FocusNode focusnode}) {
    focusnode.requestFocus();
  }

  void prevField({required FocusNode focusnode}) {
    focusnode.requestFocus();
  }


  // To send otp and navigate to otp screen
  Future sendOtp({required BuildContext context}) async {
    ///saving country code incase to read when resend code on verify otp screen
    if (signupFormKey.currentState!.validate()) {
      context.loaderOverlay.show();
      await FirebaseAuth.instance
          .verifyPhoneNumber(
        phoneNumber: '"91"${phoneController.text}', // With selected country code fro dropdown menu
        verificationCompleted: (PhoneAuthCredential credential) async {
          AppSnackbar.showSnackbar("SUCCESS",'OTP verified', AlertType.success);
          debugPrint("*****verificationCompleted fn triggered *******");
        },
        verificationFailed: (FirebaseAuthException e) {
          context.loaderOverlay.hide();
           AppSnackbar.showSnackbar("INFO",'OTP verification failed', AlertType.info);
          debugPrint("*****verificationfailed fn triggered *******");
        },
        codeSent: (String verificationId, int? resendToken) {
          context.loaderOverlay.hide();

          ///saving country code incase to read when resend code on verify otp screen
          // VerifyOtpScreenController.receivedVerificationId = verificationId;
          // VerifyOtpScreenController.isForgotPasswordFlow = false;
          Navigator.pushNamed(context, VerifyOtpScreen.routeName);
          AppSnackbar.showSnackbar("SUCCESS",'OTP sent to your phone', AlertType.success);
          debugPrint("*****codeSent fn triggered *******");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          debugPrint("*****codeAutoRetrieval fn triggered *******");
        },
      )
          .onError((error, stackTrace) {
        context.loaderOverlay.hide();
        AppSnackbar.showSnackbar("ERROR",error.toString(),AlertType.error);
      });
    }
  }

  // phone field validator
  String? phoneValidator(String? value) {
    final text = phoneController.value.text;
    if (text.isEmpty) {
      return "Please Enter Phone Number";
    } else if (text.length != 10) {
      return "Please Enter Valid Phone Number";
    }
    return null;
  }
}