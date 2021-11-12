import 'package:flutter/material.dart';
import 'package:your_plan_fitness/ProfilePage.dart';
import 'NutritionPage.dart';
import 'TrackingPage.dart';
import 'WorkoutPage.dart';

class NavController extends StatefulWidget {
  @override
  _NavControllerState createState() => _NavControllerState();
}

class _NavControllerState extends State<NavController> {
  int currIndex = 0;
  PageController pageController = PageController();
  List<Widget> screens = [
    ProfilePage(),
    TrackingPage(),
    WorkoutPage(),
    NutritionPage()
  ];

  void onPageChanged(int index) {
    setState(() {
      currIndex = index;
    });
  }

  void iconTapped(int index) {
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: screens,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: iconTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.date_range_rounded), label: 'Tracking'),
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center), label: 'Workouts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank), label: 'Nutrition')
          ],
          currentIndex: currIndex,
          selectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
