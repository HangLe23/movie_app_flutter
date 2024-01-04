import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/modules/index.dart';
import 'package:shared_ui/index.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainApp(state.user)));
        } else if (state is AuthenError) {
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset('assets/images/themovie_app_icon.png',
                        height: 200),
                    Center(child: Text('Login', style: TextStyles.titleAuthen)),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text('Email', style: TextStyles.lato400Size20),
                      ],
                    ),
                    TextFieldWidget(
                        validator: (value) {
                          return value != null &&
                                  !EmailValidator.validate(value)
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
                    TextFieldWidget(
                        hint: 'Enter your password',
                        textedit: pass,
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "Enter min 6 characters"
                              : null;
                        }),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                          },
                          child: Text('Forgot password?',
                              style: TextStyles.bluetext),
                        ),
                      ],
                    ),
                    ButtonWidget(
                      text: 'Sign in',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context)
                              .add(SignIn(email.text, pass.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Invalid'),
                                  backgroundColor: Colors.red));
                        }
                      },
                    ),
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
                          BlocProvider.of<AuthBloc>(context)
                              .add(GoogleSignIn());
                        },
                        text: 'Login with google',
                        image: 'assets/images/google.png'),
                    SizedBox(height: 5.w),
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
                        Text('You donot have an account?',
                            style: TextStyles.lato400Size20),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Register(),
                              ));
                            },
                            child: Text('Sign Up', style: TextStyles.signup))
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
