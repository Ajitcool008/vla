import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vla/src/views/profile_screen.dart';
import 'package:vla/src/views/products_screen.dart';

import '../components/drawer_widget.dart';
import '../controllers/home_controller.dart';
import '../controllers/product_controller.dart';
import 'cart_screen.dart';
import 'history_screen.dart';
import 'home_screen.dart';

class HomeTabsScreen extends StatefulWidget {
  const HomeTabsScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabsScreen> createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> {
  int activeTabIndex = 0;

  int tabIndex = 0;

  final List<Widget> tabScreens = [
    HomeScreen(),
    ProductScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var con = Get.put(HomeController());
    var procon = Get.put(ProductController());
    return Stack(
      children: [
        Scaffold(
          body: IndexedStack(
            index: activeTabIndex,
            children: tabScreens,
          ),
          bottomNavigationBar: SizedBox(
            height: Get.height*0.0815,
            child: BottomNavigationBar(
              unselectedFontSize: 0.0,
              selectedFontSize: 0.0,
              iconSize: 0.0,
                backgroundColor: Colors.transparent,
              showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: activeTabIndex,
                onTap: (index) {
                  setState(() {
                    activeTabIndex = index;
                  });
                },
                //tabIndex = index,
                // ontapBottomNav(
                // tabIndex: index, context: context),
                type: BottomNavigationBarType.fixed,
                // unselectedLabelStyle: const TextStyle(
                //   fontFamily: "Montserrat",
                //   fontWeight: FontWeight.w400,
                //   fontSize: 12,
                // ),
                // selectedLabelStyle: const TextStyle(
                //   fontFamily: "Montserrat",
                //   fontWeight: FontWeight.w400,
                //   fontSize: 12,
                // ),
                selectedItemColor: Color(0xff0EBE7F),
                unselectedItemColor: Colors.black.withOpacity(.4),
                items: [
                  buildTab(
                      // name: Localization.of(context)!.date!,
                      name: "Market",
                      isActive: activeTabIndex == 0 ? true : false),
                  buildTab(
                      name: "Product",
                      isActive: activeTabIndex == 1 ? true : false),
                ]),
          ),
        ),
        Visibility(
          visible: false,
          // visible: true,
          child: Container(
            color: Colors.grey.withOpacity(.8),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildTab(
      {required String name, required bool isActive}) {
    return BottomNavigationBarItem(
      icon: Container(
        width: Get.width * 0.5,
        height: Get.height*0.08,
        decoration: BoxDecoration(
            color: isActive ?  Color(0xff006400) :  Colors.white,
          //borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        alignment: Alignment.center,
        child: Text(name,
            style: isActive ? TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 23):
           TextStyle(color: Colors.grey, fontWeight: FontWeight.w800, fontSize: 23)),
      ),
      label: name,
    );
  }
}
