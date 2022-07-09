import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vla/src/views/home_screen.dart';

import '../../components/custom_button.dart';
import '../../components/otp_timerr.dart';
import '../../controllers/auth_controller.dart';
import '../home_tabs_screen.dart';

class VerifyOtpScreen extends StatelessWidget {
  static String routeName = '/verifyOtpScreen';

  const VerifyOtpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var con = Get.find<AuthController>();

    Size screenSize = MediaQuery.of(context).size;

    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(child: CircularProgressIndicator()),
      overlayOpacity: 0.4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white
                    // image: DecorationImage(
                    //   image: AssetImage('assets/images/Login.png'),
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenSize.height * .4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox.shrink(),
                          const SizedBox.shrink(),
                          const SizedBox.shrink(),
                          SizedBox(
                            height: screenSize.height * .226,
                            child: Image.asset(
                              'assets/images/otp.png',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * .6,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Verify OTP",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.width * .0486,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Adamina',
                              ),
                            ),
                            Text(
                              "Enter 6 digit code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xffC9C9C9),
                                fontFamily: 'Poppins',
                                fontSize: screenSize.width * .034,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox.shrink(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenSize.width * .1215,
                                  height: screenSize.width * .1215,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        con.nexField(focusnode: con.pin2FocusNode);
                                        con.changeOtpboxColor1(isWhite: true);
                                      } else {
                                        con.prevField(focusnode: con.pin1FocusNode);
                                        con.changeOtpboxColor1(isWhite: false);
                                      }
                                    },
                                    controller: con.editingControllerOTP1,
                                    textAlign: TextAlign.center,
                                    focusNode: con.pin1FocusNode,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    style: TextStyle(
                                      color: con.isStartTypingOtp1.value ? Colors.black : Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenSize.width * .06,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      filled: con.isStartTypingOtp1.value ? true : false,
                                      fillColor: con.isStartTypingOtp1.value ? Colors.white : null,
                                      counterText: "",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * .1215,
                                  height: screenSize.width * .1215,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        con.nexField(focusnode: con.pin3FocusNode);
                                        con.changeOtpboxColor2(isWhite: true);
                                      } else {
                                        con.prevField(focusnode: con.pin1FocusNode);
                                        con.changeOtpboxColor2(isWhite: false);
                                      }
                                    },
                                    controller: con.editingControllerOTP2,
                                    textAlign: TextAlign.center,
                                    focusNode: con.pin2FocusNode,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    style: TextStyle(
                                      color: con.isStartTypingOtp2.value ? Colors.black : Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenSize.width * .06,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      filled: con.isStartTypingOtp2.value ? true : false,
                                      fillColor: con.isStartTypingOtp2.value ? Colors.white : null,
                                      counterText: "",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * .1215,
                                  height: screenSize.width * .1215,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        con.nexField(focusnode: con.pin4FocusNode);
                                        con.changeOtpboxColor3(isWhite: true);
                                      } else {
                                        con.prevField(focusnode: con.pin2FocusNode);
                                        con.changeOtpboxColor3(isWhite: false);
                                      }
                                    },
                                    controller: con.editingControllerOTP3,
                                    textAlign: TextAlign.center,
                                    focusNode: con.pin3FocusNode,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    style: TextStyle(
                                      color: con.isStartTypingOtp3.value ? Colors.black : Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenSize.width * .06,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      filled: con.isStartTypingOtp3.value ? true : false,
                                      fillColor: con.isStartTypingOtp3.value ? Colors.white : null,
                                      counterText: "",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * .1215,
                                  height: screenSize.width * .1215,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        con.nexField(focusnode: con.pin5FocusNode);
                                        con.changeOtpboxColor4(isWhite: true);
                                      } else {
                                        con.prevField(focusnode: con.pin3FocusNode);
                                        con.changeOtpboxColor4(isWhite: false);
                                      }
                                    },
                                    controller: con.editingControllerOTP4,
                                    textAlign: TextAlign.center,
                                    focusNode: con.pin4FocusNode,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    style: TextStyle(
                                      color: con.isStartTypingOtp4.value ? Colors.black : Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenSize.width * .06,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      filled: con.isStartTypingOtp4.value ? true : false,
                                      fillColor: con.isStartTypingOtp4.value ? Colors.white : null,
                                      counterText: "",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * .1215,
                                  height: screenSize.width * .1215,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        con.nexField(focusnode: con.pin6FocusNode);
                                        con.changeOtpboxColor5(isWhite: true);
                                      } else {
                                        con.prevField(focusnode: con.pin4FocusNode);
                                        con.changeOtpboxColor5(isWhite: false);
                                      }
                                    },
                                    controller: con.editingControllerOTP5,
                                    textAlign: TextAlign.center,
                                    focusNode: con.pin5FocusNode,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    style: TextStyle(
                                      color: con.isStartTypingOtp5.value ? Colors.black : Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenSize.width * .06,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      filled: con.isStartTypingOtp5.value ? true : false,
                                      fillColor: con.isStartTypingOtp5.value ? Colors.white : null,
                                      counterText: "",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * .1215,
                                  height: screenSize.width * .1215,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        con.nexField(focusnode: con.pin6FocusNode);
                                        con.changeOtpboxColor6(isWhite: true);
                                      } else {
                                        con.prevField(focusnode: con.pin5FocusNode);
                                        con.changeOtpboxColor6(isWhite: false);
                                      }
                                    },
                                    controller: con.editingControllerOTP6,
                                    textAlign: TextAlign.center,
                                    focusNode: con.pin6FocusNode,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    style: TextStyle(
                                      color: con.isStartTypingOtp6.value ? Colors.black : Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenSize.width * .06,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      filled: con.isStartTypingOtp6.value ? true : false,
                                      fillColor: con.isStartTypingOtp6.value ? Colors.white : null,
                                      counterText: "",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(width: .6, color: Color(0xff868686)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox.shrink(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenSize.width * .0122),
                              child: CustomButton(
                                name: "Verify",
                                fnToBeExecute: () {
                                  con.verifyOTP(context: context);
                                },
                              ),
                            ),
                            const SizedBox.shrink(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    //  con.isOtpTimeCompleted.value ? con.resendOtp(context: context) : null;
                                    // resend=false;
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Resend" + " : ",
                                        style: TextStyle(
                                          color: con.isOtpTimeCompleted.value
                                              ? Colors.black
                                              : Colors.black.withOpacity(.4),
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenSize.width * .0438,
                                        ),
                                      ),
                                      const OTPTimer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox.shrink(),
                            const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.width * .1094, left: screenSize.width * .0389),
              child: InkWell(onTap: () => Navigator.pop(context), child: Image.asset('assets/images/arrow-left.png')),
            ),
            Visibility(
              visible: con.isUnderProgress,
              child: Expanded(
                child: Container(
                  color: Colors.black.withOpacity(.4),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool resend = false;

class OtpTimer extends StatefulWidget {
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  int _counter = 30;
  Timer? timer;
  _startTimer() {
    timer = Timer(const Duration(seconds: 1), () {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          setState(() {
            resend = true;
          });
          timer!.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _startTimer();
    return Text(
      '$_counter',
      style: TextStyle(
          fontSize: screenSize.width * .0438,
          color: const Color(0xff56C02B),
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500),
    );
  }
}
