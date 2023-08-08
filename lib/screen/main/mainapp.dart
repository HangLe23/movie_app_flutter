import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screen/profile/profilescreen.dart';

import '../../untils/Colors/colors.dart';
import '../discover/discoverscreen.dart';
import '../home/homescreen.dart';
import 'bloc/main_bloc.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            //backgroundColor: const Color(0x0015141f),
            body: bottomNavScreen.elementAt(state.tabIndex),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xFF15141f),
              currentIndex: state.tabIndex,
              onTap: (index) {
                BlocProvider.of<MainBloc>(context).add(TabChange(index: index));
              },
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
          );
        },
      ),
    );
  }
}

List<Widget> bottomNavScreen = <Widget>[
  const HomeScreen(),
  const DiscoverScreen(),
  const UserScreen(),
];
