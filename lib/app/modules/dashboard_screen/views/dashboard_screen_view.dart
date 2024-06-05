import 'package:delivery_boy/app/modules/dashboard_screen/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_screen_controller.dart';

/// The `DashboardScreenView` class in Dart is a GetView widget that displays a scaffold with a floating
/// action button and a body widget.
class DashboardScreenView extends GetView<DashboardScreenController> {
  const DashboardScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardScreenController>(
        init: DashboardScreenController(),
        builder: (controller) {
          return const Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: DashboardBottomNavigationBar(),
              body: DashboardScreenViewBody());
        });
  }
}

/// The `DashboardScreenViewBody` class is a StatelessWidget that builds the body of a dashboard screen
/// based on the current page index controlled by `DashboardScreenController`.
class DashboardScreenViewBody extends StatelessWidget {
  const DashboardScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardScreenController>(builder: (controller) {
      Widget dashBoardScreensPage =
          controller.bottomNavigationBarItems[controller.currentpageIndex.value]
              ["widget"] as Widget;
      return dashBoardScreensPage;
    });
  }
}
