import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vla/src/controllers/auth_controller.dart';
import 'package:vla/src/views/auth_screens/verify_otp_screen.dart';

import '../../components/custom_button.dart';
import '../../components/text_field_with_border.dart';

class SigninSignupScreen extends StatelessWidget {
  const SigninSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var con = Get.put(AuthController());

    // Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Container(
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
            Expanded(
              flex: 3,
              // height: screenSize.height * .35,
              child: logo(),
            ),
            Expanded(
              flex: 7,
              // height: screenSize.height * .65,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Visibility(
                      visible: con.visible.value,
                      child: signinUI(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signinUI(BuildContext context) {
    var con = Get.find<AuthController>();
    return Form(
      key: con.signupFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  con.visible.value = !con.visible.value;
                },
                child: Obx(() => Text(
                      "Welcome User",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: con.visible.value ? FontWeight.bold : FontWeight.w400,
                        color: Colors.black,
                        fontFamily: 'Adamina',
                      ),
                    )),
              ),
            ],
          ),
          SizedBox(height: 30),
          TextFieldWithBorder(
            hint: "Enter phone number",

            //icon: const SizedBox.shrink(),
            controller: con.phoneController,
            validator: con.phoneValidator,
            keyboardType: TextInputType.phone,
            maxLength: 10,
          ),
          SizedBox(height: 20),
          CustomButton(
            name: "SendOTP",
            fnToBeExecute: () => con.sendOtp(context: context),
          ),
          const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget logo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox.shrink(),
        Image.asset('assets/images/launcher_icon.png', height: Get.height * 0.18, width: Get.height * 0.18),
      ],
    );
  }
}
