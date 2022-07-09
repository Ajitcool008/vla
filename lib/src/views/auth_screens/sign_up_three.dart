import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vla/src/controllers/auth_controller.dart';

import '../../components/custom_button.dart';
import '../../components/text_field_with_border.dart';

class CreateProfileForm3 extends StatelessWidget {
  static String routeName = '/createProfileForm3';
  const CreateProfileForm3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var con = Get.find<AuthController>();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(screenSize, context),
      backgroundColor: const Color(0xff282727),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: screenSize.height,
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * .0389),
            child: Form(
              key: con.formKey3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    TextFieldWithBorder(
                      hint: "GST",
                      icon: const SizedBox.shrink(),
                      controller: con.gstController,
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        print("cgeck");
                        con.pickImage(context: context);
                      },
                      child: TextFieldWithBorder(
                        hint: "Document",
                        enabled: false,
                        icon: const SizedBox.shrink(),
                        controller: con.documentController,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      name: "Next",
                      fnToBeExecute: () => con.thirdStep(),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(Size screenSize, BuildContext context) {
    return AppBar(
      leading: Image.asset('assets/images/arrow-left.png'),
      title: Text(
        "Create Profile",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: screenSize.width * .0438,
          color: Colors.white,
          fontFamily: 'Montserrat',
          letterSpacing: 0.2,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}
