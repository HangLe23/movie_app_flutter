import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screen/discover/discoverscreen.dart';
import 'package:movie_app_flutter/screen/home/home_index.dart';
import 'package:movie_app_flutter/screen/main/main_index.dart';
import 'package:movie_app_flutter/screen/profile/profilescreen.dart';
import 'package:movie_app_flutter/untils/untils.dart';

class MainApp extends StatefulWidget {
  final User user;
  const MainApp(this.user, {super.key});

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
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.play_arrow),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
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
