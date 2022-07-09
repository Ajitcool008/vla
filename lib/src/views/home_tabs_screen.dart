import 'package:flutter/material.dart';
import 'package:vla/src/views/profile_screen.dart';
import 'package:vla/src/views/products_screen.dart';

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
    return Stack(
      children: [
        Scaffold(
          body: IndexedStack(
            index: activeTabIndex,
            children: tabScreens,
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(color: Color(0xff997264), offset: Offset(0, -.3)),
              ],
            ),
            child: BottomNavigationBar(
                backgroundColor: const Color(0xff2B2929),
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
                unselectedLabelStyle: const TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                selectedLabelStyle: const TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(.4),
                items: [
                  buildTab(
                      // name: Localization.of(context)!.date!,
                      name: "Home",
                      iconAddress: 'assets/images/home@3x.png',
                      isActive: activeTabIndex == 0 ? true : false),
                  buildTab(
                      name: "Product",
                      iconAddress: 'assets/images/nearMe@3x.png',
                      isActive: activeTabIndex == 1 ? true : false),
                  buildTab(
                      name: "History",
                      iconAddress: 'assets/images/fav@3x.png',
                      isActive: activeTabIndex == 2 ? true : false),
                  buildTab(
                      name: "Profile",
                      iconAddress: 'assets/images/bell@3x.png',
                      isActive: activeTabIndex == 3 ? true : false),
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
      {required String name, required String iconAddress, required bool isActive}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 5),
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xff997264) : const Color(0xff363636),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            iconAddress,
            color: isActive ? Colors.white : const Color(0xffE6E6E8),
            height: 19,
          ),
        ),
      ),
      label: name,
    );
  }
}
