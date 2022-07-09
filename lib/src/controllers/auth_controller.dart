import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vla/src/constants/string_constants.dart';
import 'package:vla/src/helpers/app_manager.dart';
import 'package:vla/src/helpers/network/endpoints.dart';
import 'package:vla/src/helpers/network/network_manager.dart';

import '../helpers/app_snackbar.dart';
import '../models/login_response_model.dart';
import '../views/auth_screens/sign_up_two.dart';
import '../views/auth_screens/sign_up_three.dart';
import '../views/home_tabs_screen.dart';
import '../views/auth_screens/signin_signup_screen.dart';
import '../views/auth_screens/verify_otp_screen.dart';

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
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  static bool isForgotPasswordFlow = false;
  bool isUnderProgress = false;

  RxBool visible = true.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController documentController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String generatedDeviceToken = "";

  File? pickedImageFile;
  String profileImagePath = "";

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

  final getBox = GetStorage();
  void storeStudentList(LoginModelResponse model) {
    getBox.write('StudentList', model.toJson());
  }

  LoginModelResponse restoreStudentListModel() {
    final map = getBox.read('StudentList') ?? {};
    return LoginModelResponse.fromJson(map);
  }

  // To send otp and navigate to otp screen
  Future sendOtp({required BuildContext context}) async {
    GetStorage().write('userPhone', phoneController.text);
    // Get.to(() => const VerifyOtpScreen());

    // /saving country code incase to read when resend code on verify otp screen
    if (signupFormKey.currentState!.validate()) {
      //context.loaderOverlay.show();
      await FirebaseAuth.instance
          .verifyPhoneNumber(
        phoneNumber: '+91${phoneController.text}', // With selected country code fro dropdown menu
        verificationCompleted: (PhoneAuthCredential credential) async {
          Get.to(() => const VerifyOtpScreen());
          AppSnackbar.showSnackbar("SUCCESS", 'OTP verified', AlertType.success);
          debugPrint("*****verificationCompleted fn triggered *******");
        },
        verificationFailed: (FirebaseAuthException e) {
          //context.loaderOverlay.hide();
          AppSnackbar.showSnackbar("INFO", 'OTP verification failed', AlertType.info);
          debugPrint("*****verificationfailed fn triggered *******");
        },
        codeSent: (String verificationId, int? resendToken) {
          receivedVerificationId = verificationId;
          Get.to(() => const VerifyOtpScreen());
          AppSnackbar.showSnackbar("SUCCESS", 'OTP sent to your phone', AlertType.success);
          debugPrint("*****codeSent fn triggered *******");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          debugPrint("*****codeAutoRetrieval fn triggered *******");
        },
      )
          .onError((error, stackTrace) {
        //context.loaderOverlay.hide();
        AppSnackbar.showSnackbar("ERROR", error.toString(), AlertType.error);
      });
    }
  }

  // To resend otp and navigate to otp screen
  Future resendOtp({required BuildContext context}) async {
    String countryCode = GetStorage().read('countryCode');
    String userPhone = GetStorage().read('userPhone');
    context.loaderOverlay.show();
    await FirebaseAuth.instance
        .verifyPhoneNumber(
      phoneNumber: '$countryCode$userPhone',
      verificationCompleted: (PhoneAuthCredential credential) async {
        AppSnackbar.showSnackbar("SUCCESS", 'OTP resend', AlertType.success);
        debugPrint("*****verificationCompleted fn triggered *******");
      },
      verificationFailed: (FirebaseAuthException e) {
        context.loaderOverlay.hide();
        AppSnackbar.showSnackbar("ERROR", "OTP resend failed", AlertType.error);
        debugPrint("*****verificationfailed fn triggered *******");
      },
      codeSent: (String verificationId, int? resendToken) {
        context.loaderOverlay.hide();
        AppSnackbar.showSnackbar("ERROR", "OTP resend failed", AlertType.error);
        debugPrint("*****codeSent fn triggered *******");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint("*****codeAutoRetrieval fn triggered *******");
      },
    )
        .onError((error, stackTrace) {
      context.loaderOverlay.hide();
      AppSnackbar.showSnackbar("ERROR", "${error.toString()}", AlertType.error);
    });
  }

  verifyOTP({required BuildContext context}) async {
    String enteredOTP = editingControllerOTP1.text +
        editingControllerOTP2.text +
        editingControllerOTP3.text +
        editingControllerOTP4.text +
        editingControllerOTP5.text +
        editingControllerOTP6.text;
    if (enteredOTP.isEmpty) {
      AppSnackbar.showSnackbar("ERROR", "Please enter OTP", AlertType.error);
      return;
    } else if (editingControllerOTP1.text.isEmpty ||
        editingControllerOTP2.text.isEmpty ||
        editingControllerOTP3.text.isEmpty ||
        editingControllerOTP4.text.isEmpty ||
        editingControllerOTP5.text.isEmpty ||
        editingControllerOTP6.text.isEmpty) {
      AppSnackbar.showSnackbar("ERROR", "Please enter valid OTP", AlertType.error);
      return;
    }

    enteredOTP = editingControllerOTP1.text +
        editingControllerOTP2.text +
        editingControllerOTP3.text +
        editingControllerOTP4.text +
        editingControllerOTP5.text +
        editingControllerOTP6.text;
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: receivedVerificationId, smsCode: enteredOTP);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
        // if (value.additionalUserInfo?.isNewUser ?? false) {

        // } else {
        if (value.user != null) {
          await loginUser();
        } else {
          await signOut();
        }
        // }
      });
    } on FirebaseAuthException catch (_) {
      AppSnackbar.showSnackbar("ERROR", "Wrong OTP", AlertType.error);
    }
  }

  Future<void> loginUser() async {
    await firebaseMessaging.getToken().then((String? deviceTokenString) {
      generatedDeviceToken = deviceTokenString!;
    }).catchError((onError) {
      AppSnackbar.showSnackbar("ERROR", onError.toString(), AlertType.error);
    });
    var input = {
      "operation": "RegisterS1",
      "user": {"UserName": phoneController.text, "IsPhoneVerified": "1", "DeviceToken": generatedDeviceToken}
    };

    var response = await NetworkManager.instance.getDio().post(Endpoints.registers1, data: input);
    LoginModelResponse res = LoginModelResponse.fromJson(response.data);
    storeStudentList(res);
    GetStorage().write(Constants.token, res.token);
    GetStorage().write(Constants.csDATA, res.csuid);
    if (res.message == "Step2") {
      Get.off(() => const CreateProfileForm2());
    } else {
      AppManager.statusHelper.setLoginStatus(true);
      Get.off(() => const HomeTabsScreen());
    }
    // AppManager.statusHelper.setLoginStatus(true);
  }

  void secondStep() async {
    if (formKey2.currentState!.validate()) {
      String userPhone = GetStorage().read('userPhone');
      var register2Input = {
        "operation": "RegisterS2",
        "user": {
          "UserName": userPhone,
          "csuid": restoreStudentListModel().csuid,
          "CName": nameController.text,
          "Pincode": pincodeController.text
        }
      };

      var responseRegister = await NetworkManager.instance.getDio().post(Endpoints.registers2, data: register2Input);
      Get.off(() => const CreateProfileForm3());
    }
  }

  void thirdStep() async {
    if (formKey3.currentState!.validate()) {
      dio.FormData formData = dio.FormData.fromMap({
        "operation": "RegisterS3",
        "GST": gstController.text,
        "DocumentType": "1",
        "FileImage": await dio.MultipartFile.fromFile(
          profileImagePath,
          filename: profileImagePath.split("/").last,
        ),
      });

      var responseRegister = await NetworkManager.instance.getDio().post(Endpoints.registers3, data: formData);
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GetStorage().erase();
    Get.offAll(() => const SigninSignupScreen());
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

  Future pickImage({required BuildContext context}) async {
    try {
      final pickedImage = await FilePicker.platform.pickFiles();

      if (pickedImage == null) {
        AppSnackbar.showSnackbar("ERROR", "No image selected", AlertType.error);
        return;
      } else {
        documentController.text = pickedImage.files.single.path ?? "";

        pickedImageFile = File(pickedImage.files.single.path ?? "");
      }
    } on PlatformException catch (e) {
      AppSnackbar.showSnackbar("ERROR", "Failed to pick image", AlertType.error);
      debugPrint("Failed to pick image ${e.message}");
    }
  }
}
