import 'package:delivery_boy/app/modules/onboard_screen/widget/onboard_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboard_screen_controller.dart';

/// The `OnboardScreenView` class in Dart is a GetView widget that displays the OnboardScreenViewBody
/// within a Scaffold based on the OnboardScreenController state.
class OnboardScreenView extends GetView<OnboardScreenController> {
  const OnboardScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardScreenController>(
        init: OnboardScreenController(),
        builder: (controller) {
          return const Scaffold(body: OnboardScreenViewBody());
        });
  }
}

/// The `OnboardScreenViewBody` class in Dart is a stateless widget that displays a series of onboard
/// screen pages using a `PageView` widget controlled by a `PageController`.
class OnboardScreenViewBody extends StatelessWidget {
  const OnboardScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardScreenController>(builder: (controller) {
      PageController pageController = controller.pageController;
      return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: List.generate(
              3,
              (index) => OnboardScreenPage(
                    index: index,
                    key: UniqueKey(),
                  )).map((e) => e).toList());
    });
  }
}
