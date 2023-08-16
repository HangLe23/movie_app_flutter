import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screen/main/mainapp.dart';
import '../../untils/Colors/colors.dart';
import '../../untils/TextStyles/TextStyles.dart';
import '../../widget/button.dart';
import '../../widget/buttonService.dart';
import '../../widget/divider.dart';
import '../../widget/textfields.dart';
import '../bloc/auth_bloc.dart';
import '../forgot_password/forgot_password.dart';
import '../register/register.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final key = GlobalKey<FormState>();
  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MainApp(FirebaseAuth.instance.currentUser!)));
        }
        if (state is AuthenError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthInitial || state is Authenticated) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    validator: (value) {
                      return value != null && !EmailValidator.validate(value)
                          ? 'Enter a valid email'
                          : null;
                    },
                    hint: 'Enter your email',
                    textedit: email,
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hint: 'Enter your password',
                    textedit: pass,
                    validator: (value) {
                      return value != null && value.length < 6
                          ? "Enter min 6 characters"
                          : null;
                    },
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyles.bluetext,
                        ),
                      ),
                    ],
                  ),
                  ButtonWidget(
                    text: 'Sign in',
                    function: () {
                      //if (key.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context)
                          .add(SignIn(email.text, pass.text));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainApp(FirebaseAuth.instance.currentUser!)));
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text('Invalid'),
                      //       backgroundColor: Colors.red,
                      //     ),
                      //   );
                      // }
                    },
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
                          GoogleSignIn(),
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
                        width: 20,
                      ),
                      Text(
                        'You donot have an account?',
                        style: TextStyles.lato400Size20,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Register(),
                          ));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyles.signup,
                        ),
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
    );
  }
}
