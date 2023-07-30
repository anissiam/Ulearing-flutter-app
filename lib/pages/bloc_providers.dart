import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';

import 'sign_in/bloc/sign_in_blocs.dart';
import 'welcome/bloc/welcome_bloc.dart';

class AppBlocProvider{
  static get allBlocProvider=>[
    BlocProvider(
      lazy: false, // انشاء البلوك في البداية وهذا يعمل مع البلوك المتعدد
      create: (context) => WelcomeBloc(),
    ),
    BlocProvider(
      create: (context) => SignInBloc(),
    ),
    BlocProvider(
      create: (context) => RegisterBlocs(),
    ),
  ];
}