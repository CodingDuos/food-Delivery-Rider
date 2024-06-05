import 'package:delivery_boy/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The ProfileController class in Dart defines a list of profile navigation items with icons, labels,
/// and routes for a profile menu.
class ProfileController extends GetxController {
  /// This Dart code snippet defines a list called `profileNavigationItems` containing maps. Each map
  /// represents a navigation item in a profile menu. Each map has three key-value pairs:
  /// 1. 'icon': Specifies the icon to be displayed for the navigation item.
  /// 2. 'label': Represents the text label for the navigation item.
  /// 3. 'route': Indicates the route to navigate to when the item is selected.
  List<Map<String, dynamic>> profileNavigationItems = [
    {
      'icon': Icons.maps_home_work_outlined,
      'label': 'My Address',
      'route': Routes.EDITPROFILE
    },
    {
      'icon': Icons.notifications_none_outlined,
      'label': 'Notification',
      'route': Routes.EDITPROFILE
    },
    {
      'icon': Icons.edit_document,
      'label': 'Terms of Services',
      'route': Routes.EDITPROFILE
    },
    {
      'icon': Icons.language_outlined,
      'label': 'Language',
      'route': Routes.EDITPROFILE
    },
    {'icon': Icons.logout_outlined, 'label': 'Log out'},
  ];
}
