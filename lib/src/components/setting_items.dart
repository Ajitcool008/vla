import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../views/auth_screens/signin_signup_screen.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
    required this.title,
    this.trailing,
    this.onTap,
    required this.leading,
  }) : super(key: key);
  final String title;
  final Widget? trailing;
  final Widget leading;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    void showDialog() {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 400),
        context: context,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenSize.width * 0.563,
              width: screenSize.width * 0.955,
              margin: const EdgeInsets.only(bottom: 250, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 29.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/logout.png"),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "LOGOUT",
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: "Montserrat"),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Are you sure you want to logout?",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "Montserrat"),
                      ),
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xff997264),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
                                  ),
                                  height: 53,
                                  width: screenSize.width * 0.4,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat"),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context, 'No');
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xff805B4E),
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
                                  ),
                                  height: 53,
                                  width: screenSize.width * 0.4,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xff997264),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
                                ),
                                height: 53,
                                width: screenSize.width * 0.2,
                                alignment: Alignment.center,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xff805B4E),
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
                                ),
                                height: 53,
                                width: screenSize.width * 0.2,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim),
            child: child,
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 6.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(width: 0.5, color: const Color(0xffC9A676).withOpacity(0.2)),
          ),
         // color: const Color(0xff292929),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            // iconColor: Colors.white,
            leading: leading,
            trailing: trailing ??
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(color:  Colors.grey.withOpacity(0.2), shape: BoxShape.circle),
                    child: const Center(child: Icon(Icons.navigate_next, color: Colors.black, size: 19)),
                  ),
                ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                color: Colors.black,
                fontSize: screenSize.width * .0444,
                letterSpacing: .2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
