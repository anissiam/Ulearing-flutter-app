import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';

import '../../common/widgets/flutter_toast.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController(this.context);
  Future<void> handelEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    if(userName.isEmpty){
      toastInfo(msg: 'User name need to fill password');
      return;
    }
    if(email.isEmpty){
      toastInfo(msg: 'You need to fill email address');
      return;
    }

    if(password.isEmpty){
      toastInfo(msg: 'You need to fill password');
      return;
    }
    if(rePassword.isEmpty){
      toastInfo(msg: 'Your password confirmation is wrong');
      return;
    }

    try{
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if(credential.user!=null){
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(userName);
        toastInfo(msg: 'An email has been sent to your registered email . To active it please check your email box and click on the link');
        Navigator.of(context).pop();
      }
    }on FirebaseAuthException catch(e){
      if(e.code=='email-already-in-use'){
        print('The email is already in use ');
        toastInfo(msg: 'The email is already in use ');
      }else if(e.code=='invalid-email'){
        print('your email format is wrong');
        toastInfo(msg: 'your email address format is wrong');
      }else if(e.code=='weak-password') {
        print(e.code);
        toastInfo(msg: 'The password provided is too weak');
      }
    }



  }
}