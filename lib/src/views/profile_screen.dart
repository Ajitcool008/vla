import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/setting_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Center(child: const Text('Profile')),
      ),
      body: Stack(
        children: [
          //_backgroundImage(),
          SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenSize.width * .09),
                  // SizedBox(height: screenSize.width * .037),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16, top: 8),
                  //   child: locationWidget(screenSize: screenSize, context: context),
                  // ),
                  // Stack(
                  //   clipBehavior: Clip.none,
                  //   children: [_profileImage(screenSize, screenController), _imagePicker(screenSize, screenController, context)],
                  // ),
                  CircleAvatar(
                    radius: 70,
                  ),
                  SizedBox(height: Get.height * 0.08),
                  SettingItem(
                    title: "My Profile",
                    leading: leading(screenSize: screenSize, img: 'my_profile@3x.png'),
                    //pageRoute: EditMyProfile.routeName,
                  ),
                  SizedBox(height: Get.height * 0.01),
                  SettingItem(
                    title: 'History',
                    leading: leading(screenSize: screenSize, img: 'history@3x.png'),
                    //pageRoute: HistoryScreen.routeName,
                  ),
                  SizedBox(height: Get.height * 0.01),
                  SettingItem(
                    title: "Cart",
                    leading: leading(screenSize: screenSize, img: 'lock@3x.png'),
                    //pageRoute: ChangePasswordScreen.routeName,
                  ),
                  SizedBox(height: Get.height * 0.01),
                  SettingItem(
                    title: "Logout",
                    trailing: const Icon(null),
                    leading: leading(screenSize: screenSize, img: 'logout@3x.png'),
                  ),
                  const SizedBox.shrink(),
                  const SizedBox.shrink(),
                  const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget leading({required Size screenSize, required String img}) {
    return Container(
        height: 39,
        width: 39,
        decoration: BoxDecoration(
            color: const Color(0xffDDDDDD).withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Center(child: Image.asset('assets/images/$img')));
  }
}
