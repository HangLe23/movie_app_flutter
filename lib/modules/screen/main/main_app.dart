import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

class MainApp extends StatefulWidget {
  final User? user;
  const MainApp(this.user, {super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc()..add(BottomTabChange(index: 0)),
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.tabIndex,
              children: const [
                HomeScreen(),
                GeneralSearchScreen(),
                UserScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xFF15141f),
              currentIndex: state.tabIndex,
              onTap: (index) {
                BlocProvider.of<MainBloc>(context)
                    .add(BottomTabChange(index: index));
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
