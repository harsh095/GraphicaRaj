import 'package:graphica_raj/screens/profile/profile_home.dart';
import 'package:graphica_raj/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'design_page.dart';
import 'home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  int i=0;

  List<Widget> screen= const[
    home_page(),
    design_page(),
    ProfileHome(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          i++;
        });debugPrint("object");
        if (i == 2) {
          SystemNavigator.pop();
          return true;
        }


        return false;
      },
      child: Scaffold(
        body: Center(
          child: screen[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(


          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: main_color,

          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/img_12.png",
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.08,
              ),
              label: 'Home',
              activeIcon: Image.asset(
                "assets/img_9.png",
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/img_10.png",
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.08,
              ),
              label: 'Design',
              activeIcon: Image.asset(
                "assets/img_13.png",
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/img_11.png",
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.08,
              ),
              label: 'More',
              activeIcon: Image.asset(
                "assets/img_14.png",
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
