import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/register/register_contoller.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_states.dart';
import 'package:learning_app/pages/sign_in/sign_in_controller.dart';
import '../common_widgets.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            appBar: buildAppBar('Log In'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                    child: reusableText('Or use your email account to login'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Email'),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextFiled(
                            'Enter your email address', "Email", 'user',
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText('Password'),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextFiled(
                            'Enter your password address', "password", 'lock',
                            (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }),
                        forgetPassword(),
                        buildLogInAndRegButton('Log in', 'login', () {
                          SignInController(context: context)
                              .handelSignIn('email');
                        }),
                        buildLogInAndRegButton('Sign Up', 'register', () {
                          Navigator.pushNamed(context, '/register');
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
