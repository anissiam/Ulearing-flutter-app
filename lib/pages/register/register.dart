import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/register/bloc/register_events.dart';
import 'package:learning_app/pages/register/bloc/register_states.dart';

import '../common_widgets.dart';
import 'bloc/register_blocs.dart';
import 'register_contoller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
  builder: (context, state) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: buildAppBar('Sign Up'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: reusableText('Enter your details below & free sign up'),
              ),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('User name'),

                    buildTextFiled('Enter your user name', "Email", 'user',
                            (value) {
                          context.read<RegisterBlocs>().add(UserNameEvent(value));
                        }),
                    reusableText('Email'),

                    buildTextFiled('Enter your email address', "Email", 'user',
                        (value) {
                       context.read<RegisterBlocs>().add(EmailEvent(value));
                    }),
                    reusableText('Password'),

                    buildTextFiled(
                        'Enter your password address', "password", 'lock',
                        (value) {
                      context.read<RegisterBlocs>().add(PasswordEvent(value));
                    }),
                    reusableText('Confirm Password'),

                    buildTextFiled(
                        'Re-enter your password to confirm', "password", 'lock',
                            (value) {
                              context.read<RegisterBlocs>().add(RePasswordEvent(value));
                        }),
                    Container(
                      //margin: EdgeInsets.only(left: 25.w),
                        child: reusableText('By creating an account you have to agree with our therm and condition.')),
                    buildLogInAndRegButton('Sign Up', 'login', () {
                      //Navigator.pushNamed(context, 'register');
                      RegisterController(context).handelEmailRegister();
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
