import 'package:delivery_boy/app/modules/home_page/views/home_page_view.dart';
import 'package:delivery_boy/app/modules/orders/views/orders_view.dart';
import 'package:delivery_boy/app/modules/orders/widgets/orders_details.dart';
import 'package:delivery_boy/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The `DashboardScreenController` class in Dart utilizes the GetX package to manage a reactive
/// `currentpageIndex` variable and define a list of bottom navigation bar items with associated
/// properties.
class DashboardScreenController extends GetxController {
  /// `RxInt currentpageIndex = 0.obs;` is defining a reactive variable `currentpageIndex` of type `RxInt`
  /// using the GetX package in Dart. The `.obs` extension on `0` converts the integer `0` into a reactive
  /// variable that can be listened to for changes. This means that any changes made to `currentpageIndex`
  /// will automatically trigger updates in the UI components that are dependent on it.
  RxInt currentpageIndex = 0.obs;

  /// This Dart function changes the current page index to the specified index and triggers an update.
  ///
  /// Args:
  ///   index (int): The `changePageIndex` function takes an integer `index` as a parameter. This
  /// parameter represents the new index value that will be assigned to the `currentpageIndex` variable.
  changePageIndex(int index) {
    currentpageIndex.value = index;
    update();
  }

  /// This code snippet defines a list named `bottomNavigationBarItems` containing maps. Each map in the
  /// list represents an item in a bottom navigation bar. Each map has the following key-value pairs:
  List<Map<String, dynamic>> bottomNavigationBarItems = [
    {
      'icon': Icons.home,
      'label': 'Home',
      'index': 0,
      'widget': const HomePageView()
    },
    {
      'icon': Icons.shopping_cart,
      'label': 'Orders',
      'index': 1,
      'widget': const OrdersView()
    },
    {
      'icon': Icons.insights_sharp,
      'label': 'details',
      'index': 2,
      'widget': const OrderDetailsView()
    },
    {
      'icon': Icons.person_pin_sharp,
      'label': 'Profile',
      'index': 3,
      'widget': const ProfileView()
    }
  ];
}
