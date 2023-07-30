import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController{
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handelSignIn(String type) async {
    try{
    if(type=='email'){
      final state = context.read<SignInBloc>().state;
      String emailAddress = state.email;
      String password = state.password;

      if(emailAddress.isEmpty){
        toastInfo(msg: 'You need to fill email address');
        return;
      }

      if(password.isEmpty){
        toastInfo(msg: 'You need to fill password');
      return;
      }

      try{
        final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);

        if(credential.user==null){
          toastInfo(msg: "You don't exist");
          return;

        }

        if(!credential.user!.emailVerified){
          toastInfo(msg: 'you need to verify your email account');
          return;

        }

        var user = credential.user;
        if(user!=null){
          Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345678');
          Navigator.of(context).pushNamedAndRemoveUntil('/application', (route) => false);
        }else{
          toastInfo(msg: 'Currently you are not a user of this app');
          return;

        }
      } on FirebaseAuthException catch(e){
        if(e.code=='user-not-found'){
          print('No user found for that email.');
          toastInfo(msg: 'No user found for that email');
        }else if(e.code=='wrong-password'){
          print('Wrong password provided for that user.');
          toastInfo(msg: 'Wrong password provided for that user');
        }else if(e.code=='invalid-email'){
          print('your email format is wrong');
          toastInfo(msg: 'your email address format is wrong');
        }
      }

    }
    }catch(e){

    }
  }
}