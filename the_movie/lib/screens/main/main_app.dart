import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/blocs/navigationbar/bloc/navigationbar_bloc.dart';
import 'package:the_movie/untils/Colors/colors.dart';

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
      create: (context) => NavigationbarBloc(),
      child: BlocConsumer<NavigationbarBloc, NavigationbarState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: bottomNavScreen.elementAt(state.index),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: CustomColors.backgroudcolor,
              currentIndex: state.index,
              onTap: (index) {
                BlocProvider.of<NavigationbarBloc>(context)
                    .add(TabChange(index: index));
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: CustomColors.gradientbg,
              unselectedItemColor: CustomColors.abbey,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.play_arrow), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Widget> bottomNavScreen = <Widget>[
  const Center(child: Text('Home', style: TextStyle(color: Colors.black))),
  const Center(child: Text('Play', style: TextStyle(color: Colors.black))),
  const Center(child: Text('Profile', style: TextStyle(color: Colors.black))),
];
