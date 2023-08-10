import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/authentication/login/login.dart';
import 'package:movie_app_flutter/untils/Colors/colors.dart';
import 'package:movie_app_flutter/widget/button.dart';
import 'package:movie_app_flutter/widget/textfields.dart';

import '../../untils/TextStyles/TextStyles.dart';
import '../../widget/buttonService.dart';
import '../../widget/divider.dart';
import '../bloc/auth_bloc.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'THE MOVIE',
            style: TextStyles.titleTheMovie,
          ),
        ),
        backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AuthInitial) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/themovie_app_icon.png',
                        height: 200),
                    Text('Register', style: TextStyles.titleAuthen),
                    TextFieldWidget(
                        textedit: email,
                        hint: 'Enter your email',
                        color: Colors.white30),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        textedit: password,
                        hint: 'Enter your password',
                        color: Colors.white30),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        textedit: confirm,
                        hint: 'Confirm your password',
                        color: Colors.white30),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(
                      function: () async {
                        if (password.text == confirm.text) {
                          if (password.text.length > 8) {
                            try {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignUp(
                                    email: email.text,
                                    password: password.text,
                                    context: context),
                              );
                            } catch (e) {
                              // Xử lý các lỗi có thể xảy ra trong quá trình đăng ký
                              print('Lỗi khi đăng ký người dùng: $e');
                            }
                          } else {
                            print('Mat khau khong du ky tu');
                          }
                        } else {
                          print('Mat khau khong dung');
                        }
                      },
                      text: 'Đăng ký',
                    ),
                    Row(
                      children: [
                        DividerWidget(
                          color: CustomColors.lineGrey,
                          height: 1,
                          width: 150,
                        ),
                        Text(
                          'OR',
                          style: TextStyles.or,
                        ),
                        DividerWidget(
                          color: CustomColors.lineGrey,
                          height: 1,
                          width: 150,
                        )
                      ],
                    ),
                    AuthenService(
                        function: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            GoogleSignIn(context: context),
                          );
                        },
                        text: 'Login with google',
                        image: 'assets/images/google.png'),
                    const SizedBox(
                      height: 5,
                    ),
                    AuthenService(
                        function: () {},
                        text: 'Login with facebook',
                        image: 'assets/images/Facebook.png'),
                    const SizedBox(
                      height: 5,
                    ),
                    AuthenService(
                        function: () {},
                        text: 'Login with apple',
                        image: 'assets/images/apple.png'),
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          'You have an account?',
                          style: TextStyles.lato400Size20,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Login(),
                            ));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyles.signup,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
