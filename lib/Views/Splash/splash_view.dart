import 'dart:async';

import 'package:NexToyMobile/Core/Constants/App/app_constanst.dart';
import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Core/Navigation/navigation_service.dart';
import 'package:NexToyMobile/Views/Onboarding/View/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer _timer;
  @override
  void initState() {
    _timer = Timer(Duration(seconds: 3), () {
      NavigatorService().navigateToReplace(Onboarding());
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: context.width * .7,
              height: context.width * .7,
              child: LottieBuilder.asset("assets/lottie/duck.json"),
            ),
            Text(
              AppConstansts.appName,
              style: context.textTheme.headline3.copyWith(
                  color: context.theme.primaryColor, letterSpacing: 1),
            ),
          ],
        ),
      ),
    );
  }
}
