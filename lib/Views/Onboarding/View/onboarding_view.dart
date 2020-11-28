import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Core/Extension/string_extension.dart';
import 'package:NexToyMobile/Core/Navigation/navigation_service.dart';
import 'package:NexToyMobile/Views/CustomNavBar/custom_nav_bar.dart';
import 'package:NexToyMobile/Views/Onboarding/Model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController;
  ValueNotifier<int> _index = ValueNotifier<int>(0);
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _index,
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              if (value == 2) {
                NavigatorService().navigateToReplace(CustomNavBar());
              } else {
                _pageController.animateToPage(22,
                    duration: Duration(milliseconds: 250),
                    curve: Curves.linear);
              }
            },
            child: Icon(value == 2 ? Icons.check : Icons.arrow_right),
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
              flex: 9,
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) => {_index.value = value},
                children: onboarding
                    .map((onboarding) => Transform.scale(
                          scale: .9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  height: context.height * .7,
                                  child: SvgPicture.asset(onboarding.image)),
                              Text(
                                onboarding.text.locale,
                                style: context.textTheme.bodyText1,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              )),
          Expanded(
              flex: 1,
              child: SmoothPageIndicator(
                  controller: _pageController,
                  count: onboarding.length,
                  effect:
                      WormEffect(activeDotColor: context.theme.primaryColor),
                  onDotClicked: (index) {})),
        ],
      ),
    );
  }
}
