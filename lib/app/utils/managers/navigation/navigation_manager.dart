import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/app/controller/bloc/home/home_bloc.dart';
import 'package:form_app/app/view/under_development_screen/under_development_screen.dart';

import '../../../view/home_screen/home_screen.dart';
import '../../../view/splash_screen/splash_screen.dart';
import '../../constants/route_constants.dart';

class NavigationManager {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldState> homeScreenScaffoldKey =
      GlobalKey<ScaffoldState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BlocProvider(
                  create: (context) => HomeBloc(),
                  child: const HomeScreen(),
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() =>
      MaterialPageRoute(builder: (_) => const UnderDevelopmentScreen());
}
