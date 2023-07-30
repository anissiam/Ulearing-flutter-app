import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/routes/routes.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learning_app/global.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //home: const Welcome(),
            onGenerateRoute: AppPages.GenerateRouteSettings,
            //initialRoute:'/' ,
            
            /*routes: {
              "signIn": (context) => const SignIn(),
              "register": (context) => const Register(),
            },*/
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(
                        color: AppColors.primaryText
                    ),
                    elevation: 0, backgroundColor: Colors.white)),
          );
        },
      ),
    );
  }
}
