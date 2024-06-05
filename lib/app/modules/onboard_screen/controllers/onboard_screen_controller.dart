import 'package:delivery_boy/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardScreenController extends GetxController {
  /// The line `final PageController pageController = PageController();` is creating an instance of the
  /// `PageController` class from the Flutter framework. This controller is typically used to control a
  /// `PageView` widget, allowing you to navigate between different pages or screens by scrolling
  /// horizontally. In this context, the `pageController` is used to manage the page navigation within an
  /// onboarding screen, enabling the user to swipe through different onboarding pages.
  final PageController pageController = PageController();

  /// The `List<Map<String, dynamic>> onBoardData` is a list of maps in Dart. Each map in the list
  /// represents data for an onboarding screen.
  List<Map<String, dynamic>> onBoardData = [
    {
      "title": "Welcome to QuickDeliver",
      "image": "images/onboard.png",
      "description":
          "Dive into a world of speedy deliveries and delicious eats! Join QuickDeliver as a delivery boy to bring smiles and satisfaction to hungry customers. Let's get started on your journey of hassle-free onboarding and flexible earning opportunities",
    },
    {
      "title": "GourmetDash Onboarder",
      "image": "images/onboard1.png",
      "description":
          "Ready to embark on a culinary adventure? GourmetDash is your gateway to becoming a top-notch delivery pro. Follow our easy onboarding process, and you'll soon be delighting customers with gourmet meals. Start earning on your schedule today!",
    },
    {
      "title": "FeastRunner Sign-Up",
      "image": "images/onboard2.png",
      "description":
          "Welcome to FeastRunner, where delivering happiness is a tap away! Our user-friendly onboarding screens make joining our delivery team a breeze. Enjoy the freedom to choose your hours and deliver a feast of flavors to eager customers. Let's begin your journey with FeastRunner!",
    },
  ];

  /// `var currentIndex = 0.obs;` is defining a variable `currentIndex` using GetX's `obs` (observable)
  /// feature. In GetX, observables are used to track changes to a variable and automatically update any
  /// widgets that are dependent on that variable.
  var currentIndex = 0.obs;

  /// The `updateOnboardPage` function in Dart updates the current page on a page controller if the
  /// current index is not 2 by animating to the next page and incrementing the current index.
  updateOnboardPage() async {
    if (currentIndex.value != 2) {
      await pageController
          .animateToPage(
            currentIndex.value + 1,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          )
          .then((value) =>
              {currentIndex.value = currentIndex.value + 1, update()});
    } else {
      Get.toNamed(Routes.DASHBOARD_SCREEN);
    }
  }
}
