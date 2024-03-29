import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    email.text = user?.email ?? '';
    name.text = user?.displayName ??
        ''; // Set the initial value of the email controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const SizedBox(
              width: 150,
            ),
            Text(
              'Profile',
              style: TextStyles.tittle,
            ),
            const Spacer(),
            BlocProvider(
              create: (context) => AuthBloc(AuthenServiceOnTap()),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(SignOut());
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                    },
                    child: Text(
                      'Logout',
                      style: TextStyles.lato500Size24,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => ProfileBloc(),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial || state is Success) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(35),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100.r,
                      backgroundColor: CustomColors.rectangle,
                    ),
                    TextButton(
                        onPressed: () {},
                        child:
                            Text('Update Image', style: TextStyles.bluetext)),
                    SizedBox(height: 20.w),
                    Row(children: [
                      Text('Name', style: TextStyles.lato400Size20)
                    ]),
                    SizedBox(height: 5.w),
                    TextFieldWidget(
                      textedit: name,
                      hint: '',
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 20.w),
                    Row(
                      children: [
                        Text('Email', style: TextStyles.lato400Size20)
                      ],
                    ),
                    SizedBox(height: 5.w),
                    TextFieldWidget(
                      textedit: email,
                      hint: '',
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 20.w),
                    ButtonWidget(
                      function: () {
                        BlocProvider.of<ProfileBloc>(context).add(
                          UpdateProfile(name: name.text, email: email.text),
                        );
                      },
                      text: 'Save',
                    ),
                  ],
                ),
              );
            } else if (state is LoadUpdate) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
