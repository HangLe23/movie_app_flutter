import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';
import 'package:shared_ui/widget/text_field_password.dart';

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/themovie_app_icon.png',
                      height: 200.w),
                  Center(
                      child: Text('Register', style: TextStyles.titleAuthen)),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Text('Email', style: TextStyles.lato400Size20),
                    ],
                  ),
                  TextFieldWidget(
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? 'Enter a valid email'
                            : null;
                      },
                      hint: 'Enter your email',
                      textedit: email),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Text('Password', style: TextStyles.lato400Size20),
                    ],
                  ),
                  TextFieldPassword(
                      hint: 'Enter your password',
                      textedit: pass,
                      validator: (value) {
                        return value != null && value.length < 6
                            ? "Enter min 6 characters"
                            : null;
                      }),
                  SizedBox(height: 10.w),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Text('Confirm Password', style: TextStyles.lato400Size20),
                    ],
                  ),
                  TextFieldPassword(
                      validator: (String? value) {
                        return value != null && value != pass.text
                            ? "Passwords do not match"
                            : null;
                      },
                      hint: 'Confirm your password',
                      textedit: confirmPass),
                  SizedBox(height: 10.w),
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
                      SizedBox(width: 5.h),
                      DividerWidget(
                        color: CustomColors.lineGrey,
                        height: 1.w,
                        width: 100.h,
                      ),
                      Text('OR', style: TextStyles.or),
                      DividerWidget(
                        color: CustomColors.lineGrey,
                        height: 1.w,
                        width: 100.h,
                      )
                    ],
                  ),
                  AuthenService(
                      function: () {
                        BlocProvider.of<AuthBloc>(context).add(GoogleSignIn());
                      },
                      text: 'Login with google',
                      image: 'assets/images/google.png'),
                  SizedBox(height: 5.w),
                  AuthenService(
                      function: () {},
                      text: 'Login with facebook',
                      image: 'assets/images/Facebook.png'),
                  SizedBox(height: 5.w),
                  AuthenService(
                      function: () {},
                      text: 'Login with apple',
                      image: 'assets/images/apple.png'),
                  Row(
                    children: [
                      SizedBox(width: 50.h),
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
