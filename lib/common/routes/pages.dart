import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/application/bloc/app_blocs.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';
import 'package:learning_app/pages/register/register.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:learning_app/pages/sign_in/sign_in.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:learning_app/pages/welcome/welcome.dart';

import '../../pages/application/application_page.dart';

class AppPages {
  static List<PageEntity> routes () {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: Register(),
          bloc: BlocProvider(create: (_) => RegisterBlocs())),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: ApplicationPage(),
         bloc:BlocProvider(create: (_)=>AppBloc())
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];
    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name!=null){
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route==AppRoutes.INITIAL && deviceFirstOpen){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            MaterialPageRoute(builder: (_) => const ApplicationPage(),settings: settings,);
          }
          return MaterialPageRoute(builder: (_) => const SignIn(),settings: settings,);
        }
        return MaterialPageRoute(builder: (_) => result.first.page,settings: settings,);
      }
    }
    return MaterialPageRoute(builder: (_) => const SignIn(),settings: settings,);
  }
}


class PageEntity {
  String route;

  Widget page;

  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
