import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../helpers/app_manager.dart';
import '../helpers/helper_entension.dart';
import '../views/auth_screens/signin_signup_screen.dart';
import '../views/profile_screen.dart';

class DrawerElement extends StatelessWidget {
  DrawerElement({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: Get.width * 0.7,
            //padding: EdgeInsets.only(left: Get.width * 0.04, top: 10, bottom: 10),
            child: ClipRRect(
                //borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                child: Drawer(
                  child: ListView(
                    // padding: EdgeInsets.zero,
                    children: <Widget>[
                      SizedBox(
                        height: Get.height * 0.19,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<HomeController>().scaffoldEy.currentState?.openEndDrawer();
                          Get.to(() => const ProfileScreen());
                        },
                        child: ListTile(
                          dense: true,
                          leading: RadiantGradientMask(
                              child: Icon(
                                Icons.person_outline,
                                size: Get.width * 0.07,
                                color: Colors.white,
                              )
                          ),
                          title: Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              color: const Color(0xFF232323),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        onTap: () {
                          Get.find<HomeController>().scaffoldEy.currentState?.openEndDrawer();
                          //Get.to(() =>  AttendanceScreen());
                        },
                        leading: RadiantGradientMask(
                            child: Icon(
                              Icons.assignment_ind_outlined,
                              size: Get.width * 0.07,
                              color: Colors.white,
                            )),
                        title: Text(
                          'My Order',
                          style: TextStyle(
                            fontSize: Get.width * 0.045,
                            color: const Color(0xFF232323),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        onTap: () {
                          Get.find<HomeController>().scaffoldEy.currentState?.openEndDrawer();
                          //Get.to(() => const AssignmentScreen());
                        },
                        leading: RadiantGradientMask(
                            child: Icon(
                              Icons.payment_outlined,
                              size: Get.width * 0.07,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Pay Freight',
                          style: TextStyle(
                            fontSize: Get.width * 0.045,
                            color: const Color(0xFF232323),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        onTap: () {
                          Get.find<HomeController>().scaffoldEy.currentState?.openEndDrawer();
                          //Get.to(() => CalenderAndEventScreen());
                        },
                        leading: RadiantGradientMask(
                            child: Icon(
                              Icons.wallet_membership_outlined,
                              size: Get.width * 0.07,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Wallet',
                          style: TextStyle(
                            fontSize: Get.width * 0.045,
                            color: const Color(0xFF232323),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        onTap: () {
                          Get.find<HomeController>().scaffoldEy.currentState?.openEndDrawer();
                         // Get.to(() => const ResultScreen());
                        },
                        leading: RadiantGradientMask(
                            child: Icon(
                              Icons.card_giftcard_outlined,
                              size: Get.width * 0.07,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Reward',
                          style: TextStyle(
                            fontSize: Get.width * 0.045,
                            color: const Color(0xFF232323),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        onTap: () {
                          Get.find<HomeController>().scaffoldEy.currentState?.openEndDrawer();
                         // Get.to(() => const ClassTestScreen());
                        },
                        leading: RadiantGradientMask(
                            child: Icon(
                              Icons.monitor_weight_outlined,
                              size: Get.width * 0.07,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Weight Chart',
                          style: TextStyle(
                            fontSize: Get.width * 0.045,
                            color: const Color(0xFF232323),
                          ),
                        ),
                      ),

                      ListTile(
                        dense: true,
                        onTap: () {
                          Get.find<HomeController>().scaffoldEy.currentState?.openEndDrawer();
                         // Get.to(() => const TimeTableScreen());
                        },
                        leading: RadiantGradientMask(
                            child: Icon(
                             // ImageIcon(AssetImage()),
                               Icons.phone_android_outlined,
                              size: Get.width * 0.07,
                              color: Colors.white,
                            )
                        ),
                        title: Text(
                          'Contact us',
                          style: TextStyle(
                            fontSize: Get.width * 0.045,
                            color: const Color(0xFF232323),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        onTap: () {
                          Get.find<HomeController>().scaffoldEy.currentState?.openEndDrawer();
                         // Get.to(() => const DateSheetScreen());
                        },
                        leading: RadiantGradientMask(
                            child: Icon(
                              Icons.group_outlined,
                              size: Get.width * 0.07,
                              color: Colors.white
                            )),
                        title: Text(
                          'About us',
                          style: TextStyle(
                            fontSize: Get.width * 0.045,
                            color: const Color(0xFF232323),
                          ),
                        ),
                      ),

                      // ListTile(
                      //   dense: true,
                      //   onTap: () {
                      //     // Get.find<HomeController>().scaffoldEy.currentState?.openEndDrawer();
                      //   },
                      //   leading: RadiantGradientMask(
                      //       child: Icon(
                      //         Icons.help_outline_outlined,
                      //         size: Get.width * 0.07,
                      //         color: Colors.white,
                      //       )),
                      //   title: Text(
                      //     'Help & Support',
                      //     style: TextStyle(
                      //       fontSize: Get.width * 0.045,
                      //       color: const Color(0xFF232323),
                      //     ),
                      //   ),
                      // ),

                      if (AppManager.statusHelper.getLoginStatus)
                        InkWell(
                          onTap: () {
                            AppManager.statusHelper.setLoginStatus(false);
                            GetStorage().erase();
                            Get.offAll(() => SigninSignupScreen());
                          },
                          child: ListTile(
                            dense: true,
                            leading: RadiantGradientMask(
                                child: Icon(
                                  Icons.logout,
                                  size: Get.width * 0.07,
                                  color: Colors.white,
                                )),
                            title: Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: Get.width * 0.045,
                                color: const Color(0xFF232323),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ))),
        Positioned(
          top: Get.height*0.08,
          left: Get.width*0.06,
          child: Container(
            width: Get.width*0.55,
            height: Get.height*0.065,
            decoration: BoxDecoration(
              color: Color(0xff228B22),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(child: Text('Login',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800),)),
          ),
        ),
      ],
    );
  }
  divider(){
    return Divider(
      height: Get.height*0.0001,
      color: Color(0xffFAD11F),
      thickness: 1.5,
      endIndent: 30,
      indent: 48,
    );
  }
}