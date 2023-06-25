import 'package:flutter/material.dart';
import 'package:form_app/app/utils/constants/route_constants.dart';
import 'package:form_app/app/utils/extension/navigation_extentions.dart';
import 'package:form_app/app/utils/ui_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => context.pushReplacementNamed(Routes.homeScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setDeviceSize(MediaQuery.of(context).size);
    return const Scaffold(
      body: Center(
          child: FlutterLogo(
        size: 100,
      )),
    );
  }
}
