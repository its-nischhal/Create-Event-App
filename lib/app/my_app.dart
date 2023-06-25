import 'package:flutter/material.dart';
import 'package:form_app/app/utils/managers/navigation/navigation_manager.dart';

import 'package:form_app/app/utils/constants/route_constants.dart';
import 'package:form_app/app/utils/theme/custom_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: CustomTheme.lightTheme(),
      initialRoute: Routes.splashScreen,
      navigatorKey: NavigationManager.navigatorKey,
      onGenerateRoute: NavigationManager.onGenerateRoute,
    );
  }
}
