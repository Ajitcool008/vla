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

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SingleChildScrollView(
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
                height: screenSize.height * .35,
                child: logo(),
              ),
              SizedBox(
                height: screenSize.height * .65,
                child: Padding(
                  padding: EdgeInsets.all(screenSize.width * .0389),
                  child: Column(
                    children: [
                      Visibility(
                        visible: con.visible.value,
                        child: signinUI(screenSize, context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget signinUI(Size screenSize, BuildContext context) {
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
                child: Obx(
                  () => Text(
                    "SIGNIN",
                    style: TextStyle(
                      fontSize: con.visible.value ? screenSize.width * .0413 : screenSize.width * .0438,
                      fontWeight: con.visible.value ? FontWeight.w400 : FontWeight.bold,
                      color: con.visible.value ? Colors.black.withOpacity(.7) : Colors.black,
                      fontFamily: 'Adamina',
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  con.visible.value = !con.visible.value;
                },
                child: Obx(() => Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: con.visible.value ? screenSize.width * .0438 : screenSize.width * .0413,
                        fontWeight: con.visible.value ? FontWeight.bold : FontWeight.w400,
                        color: con.visible.value ? Colors.black.withOpacity(.7) : Colors.black,
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
          SizedBox(height: screenSize.width * .0851),
          SizedBox(height: screenSize.height * .045),
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
        Image.asset(
          'assets/images/launcher_icon.png',
          height: 175,
          width: 100,
        ),
      ],
    );
  }
}
