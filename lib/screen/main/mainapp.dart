import 'package:flutter/material.dart';
import 'package:movie_app_flutter/screen/user/userscreen.dart';

import '../../untils/Colors/colors.dart';
import '../discover/discoverscreen.dart';
import '../home/homescreen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: const Color(0x0015141f),
        body: _buildCurrentScreen(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF15141f),
          currentIndex: currentIndex,
          onTap: (index) => onchange(index),
          selectedItemColor: CustomColors.gradientbg,
          unselectedItemColor: CustomColors.abbey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Info',
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildCurrentScreen() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const DiscoverScreen();
      case 2:
        return const UserScreen();
      default:
        return const HomeScreen(); // Màn hình mặc định
    }
  }

  onchange(int index) async {
    setState(() {
      currentIndex = index;
    });
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String packageName = packageInfo.packageName;
    // print(packageName);
  }
}
