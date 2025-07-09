import 'package:doc_app/core/di/dependency_injection.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/features/home/ui/home_screen.dart';
import 'package:doc_app/features/login/ui/login_screen.dart';
import 'package:doc_app/features/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/logic/cubit/login_cubit.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
