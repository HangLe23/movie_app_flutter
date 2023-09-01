import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/authentication/bloc/auth_bloc.dart';
import 'package:movie_app_flutter/authentication/login/login.dart';
import 'package:movie_app_flutter/screen/main/main_index.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final key = GlobalKey<FormState>();
  final email = TextEditingController();
  final pass = TextEditingController();
  final confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainApp(state.user)),
          );
        }
        if (state is AuthenError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AuthInitial || state is Authenticated) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: key,
              child: Column(
                children: [
                  TextFieldWidget(
                      hint: 'Enter email',
                      textedit: email,
                      validator: (String? value) {
                        return value != null && !EmailValidator.validate(value)
                            ? 'Enter a valid email'
                            : null;
                      }),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                      validator: (String? value) {
                        return value != null && value.length < 6
                            ? "Enter min 6 characters"
                            : null;
                      },
                      hint: 'Enter password',
                      textedit: pass),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                      validator: (String? value) {
                        return value != null && value != pass.text
                            ? "Passwords do not match"
                            : null;
                      },
                      hint: 'Confirm your password',
                      textedit: confirmPass),
                  const SizedBox(height: 20),
                  ButtonWidget(
                      function: () {
                        if (key.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignUp(email.text, pass.text, confirmPass.text),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid'),
                                backgroundColor: Colors.red),
                          );
                        }
                      },
                      text: 'Sign Up'),
                  Row(
                    children: [
                      DividerWidget(
                          color: CustomColors.lineGrey,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.375),
                      Text('OR', style: TextStyles.or),
                      DividerWidget(
                          color: CustomColors.lineGrey,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.375)
                    ],
                  ),
                  AuthenService(
                      function: () {
                        BlocProvider.of<AuthBloc>(context).add(GoogleSignIn());
                      },
                      text: 'Login with google',
                      image: 'assets/images/google.png'),
                  const SizedBox(height: 5),
                  AuthenService(
                      function: () {},
                      text: 'Login with facebook',
                      image: 'assets/images/Facebook.png'),
                  const SizedBox(height: 5),
                  AuthenService(
                      function: () {},
                      text: 'Login with apple',
                      image: 'assets/images/apple.png'),
                  Row(
                    children: [
                      const SizedBox(width: 50),
                      Text('You have an account?',
                          style: TextStyles.lato400Size20),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                        },
                        child: Text('Sign In', style: TextStyles.signup),
                      ),
                      const SizedBox(width: 40)
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
