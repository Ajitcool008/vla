import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../components/setting_items.dart';
import '../helpers/app_manager.dart';
import 'auth_screens/signin_signup_screen.dart';
import 'cart_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.brown,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height*0.4,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Color(0xff0EBE7F),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28.0),
                      bottomRight: Radius.circular(28.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Image.asset('assets/images/Vector 2.png'),
                    SizedBox(height: Get.height*0.04,),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.04),
                      child: Text('More',
                        style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.w700),),
                    ),
                    SizedBox(height: Get.height*0.01,),
                    Stack(
                        fit: StackFit.loose, children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50,
                            child: CircleAvatar(
                              radius: 48,
                            ),
                          ),
                        ],),
                      Padding(
                          padding: EdgeInsets.only(top: Get.height*0.095,left: Get.width*0.18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20.0,
                                // child: Image.asset('assets/images/activeedit.png',fit: BoxFit.cover,scale: 0.2,),
                              )],)),]),
                    SizedBox(height: Get.height*0.01,),
                    Center(child: Text('Alex Carry',
                        style: TextStyle(color: Colors.white,fontSize: 22, fontWeight: FontWeight.w600))),
                    SizedBox(height: Get.height*0.01,),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.05),
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
                onTap: () => Get.to(CartScreen()),
                title: "Cart",
                leading: leading(screenSize: screenSize, img: 'lock@3x.png'),
                //pageRoute: ChangePasswordScreen.routeName,
              ),
              SizedBox(height: Get.height * 0.01),
              SettingItem(
                onTap: () {
                  AppManager.statusHelper.setLoginStatus(false);
                  GetStorage().erase();
                  Get.offAll(SigninSignupScreen());
                },
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
    );
  }

  Widget leading({required Size screenSize, required String img}) {
    return Container(
        height: 39,
        width: 39,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Center(child: Image.asset('assets/images/$img',color: Color(0xff0EBE7F),)));
  }
}
