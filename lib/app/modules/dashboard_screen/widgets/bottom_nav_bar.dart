import 'package:delivery_boy/app/constants/constants_colors.dart';
import 'package:delivery_boy/app/modules/dashboard_screen/controllers/dashboard_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The `DashboardBottomNavigationBar` class in Dart defines a bottom navigation bar widget with
/// customizable navigation items.
class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardScreenController>(builder: (controller) {
      List<Map<String, dynamic>> bottomNavigationBarItems =
          controller.bottomNavigationBarItems;
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        height: 60,
        width: double.infinity,
        child: Row(
            children: bottomNavigationBarItems.map((navBarItem) {
          String label = navBarItem["label"] as String;
          IconData icon = navBarItem["icon"] as IconData;
          int index = navBarItem["index"] as int;
          Color itemColor = controller.currentpageIndex.value == index
              ? AppColors.primaryColor
              : Colors.grey;
          return buildNavigationItem(
              label: label,
              icon: icon,
              index: index,
              color: itemColor,
              onTap: () {
                controller.changePageIndex(index);
              });
        }).toList()),
      );
    });
  }

  /// The function `buildNavigationItem` creates a widget for a navigation item with a label, icon, index,
  /// color, and onTap function.
  ///
  /// Args:
  ///   label (String): The `label` parameter is a required String that represents the text label to be
  /// displayed on the navigation item.
  ///   icon (IconData): The `icon` parameter in the `buildNavigationItem` function is of type `IconData`.
  /// It is used to specify the icon that will be displayed in the navigation item.
  ///   index (int): The `index` parameter is an integer value that is required when calling the
  /// `buildNavigationItem` function. It is used to specify the position or index of the navigation item
  /// within a list or array.
  ///   color (Color): The `color` parameter in the `buildNavigationItem` function is used to specify the
  /// color of the icon and text in the navigation item widget. It is required to be provided when calling
  /// the function and will determine the visual appearance of the navigation item.
  ///   onTap (Function): The `onTap` parameter in the `buildNavigationItem` function is a required
  /// function that will be called when the user taps on the widget. It is used to define the action or
  /// behavior that should occur when the widget is tapped.
  ///
  /// Returns:
  ///   The `buildNavigationItem` function is returning an `Expanded` widget containing an `InkWell`
  /// widget. The `InkWell` widget has a `Column` child containing an `Icon` and a `Text` widget.
  Widget buildNavigationItem(
      {required String label,
      required IconData icon,
      required int index,
      required Color color,
      required Function() onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
