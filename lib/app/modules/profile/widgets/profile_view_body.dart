// ignore_for_file: avoid_print

import 'package:delivery_boy/app/constants/constants_colors.dart';
import 'package:delivery_boy/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The `ProfileViewBody` class in Dart defines a widget for displaying a user profile with header, user
/// information, edit button, navigation items, and assistance options.
class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      List<Map<String, dynamic>> profileNavigationItems =
          controller.profileNavigationItems;
      return SafeArea(
        child: Column(
          children: [
            buildProfileHeaderWidget(controller),
            buildUserInformationWidget(
                userImage: 'images/onboard.png',
                username: 'Anna Smith Miller',
                email: 'Anna1645@gmail.com'),
            buildEditButtonWidget(() {}),
            buildProfileNavigationItem(profileNavigationItems),
            buildAssistanceWidget(() {}),
            const SizedBox(height: 80)
          ],
        ),
      );
    });
  }

  /// The `buildProfileHeaderWidget` function returns a Row widget with an IconButton for back
  /// navigation, a Text widget displaying 'Profile', and an IconButton for additional options.
  ///
  /// Args:
  ///   controller (ProfileController): The `controller` parameter in the `buildProfileHeaderWidget`
  /// function is of type `ProfileController`. It is used to manage the state and data related to the
  /// profile being displayed in the widget.
  ///
  /// Returns:
  ///   A Row widget containing an IconButton with an arrow back icon, a Text widget displaying 'Profile'
  /// with bold styling, and another IconButton with a more options icon.
  buildProfileHeaderWidget(ProfileController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
      ],
    );
  }

  /// The `buildUserInformationWidget` function creates a widget displaying user information with an
  /// image, username, and email.
  ///
  /// Args:
  ///   userImage (String): The `userImage` parameter is a required String that represents the image URL
  /// or path of the user's profile picture.
  ///   username (String): The `username` parameter in the `buildUserInformationWidget` function is a
  /// required String that represents the username of the user for whom the information widget is being
  /// built.
  ///   email (String): The `buildUserInformationWidget` function you provided creates a widget that
  /// displays user information including the user's image, username, and email. The `email` parameter is
  /// a required String that represents the user's email address.
  ///
  /// Returns:
  ///   The `buildUserInformationWidget` function is returning a widget that displays user information. It
  /// consists of a `CircleAvatar` displaying the user's image, followed by a `ListTile` containing the
  /// username as the title and the email as the subtitle. The email subtitle is styled with grey color.
  /// The entire content is wrapped in a `Padding` widget with some padding around it.

  buildUserInformationWidget(
      {required String userImage,
      required String username,
      required String email}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(userImage),
          ),
          Expanded(
              child: ListTile(
            title: Text(username),
            subtitle: Text(
              email,
              style: const TextStyle(color: Colors.grey),
            ),
          )),
        ],
      ),
    );
  }

  /// The `buildEditButtonWidget` function returns a MaterialButton widget with a container that has a
  /// "Edit Profile" text inside.
  ///
  /// Args:
  ///   ontap (void Function()): The `ontap` parameter is a function that will be called when the
  /// MaterialButton is tapped or pressed. It is a callback function that you can define to perform a
  /// specific action when the button is clicked.
  ///
  /// Returns:
  ///   A MaterialButton widget with a Container child that has a BoxDecoration, height, width, and a Text
  /// widget inside. The MaterialButton has an onPressed callback function assigned to the ontap parameter
  /// provided to the buildEditButtonWidget function.
  buildEditButtonWidget(void Function() ontap) {
    return MaterialButton(
      onPressed: ontap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor),
          height: 45,
          width: double.infinity,
          child: const Center(
              child: Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ))),
    );
  }

  /// The function `buildProfileNavigationItem` creates a list of ListTile widgets based on the provided
  /// profileNavigationItems data.
  ///
  /// Args:
  ///   profileNavigationItems (List<Map<String, dynamic>>): The `buildProfileNavigationItem` function
  /// takes a list of profile navigation items as input. Each item in the list is a map with the following
  /// keys:
  ///
  /// Returns:
  ///   The `buildProfileNavigationItem` function returns an `Expanded` widget containing a `Column`
  /// widget with a list of `ListTile` widgets based on the provided `profileNavigationItems`. Each
  /// `ListTile` represents a navigation item with a label, icon, and optional route. The function sets up
  /// the UI for displaying profile navigation items in a column layout with appropriate styling and
  /// functionality for tapping on
  buildProfileNavigationItem(
      List<Map<String, dynamic>> profileNavigationItems) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: profileNavigationItems.map((e) {
          String label = e['label'] as String;
          IconData icon = e['icon'] as IconData;
          String route = e['route'] != null ? e['route'] as String : '';
          return ListTile(
              onTap: () {
                if (route.isNotEmpty) {
                  Get.toNamed(route);
                }
              },
              title: Text(label),
              trailing: route.isNotEmpty
                  ? const Icon(Icons.arrow_forward_ios, size: 15)
                  : null,
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Icon(icon, color: AppColors.primaryColor, size: 25),
                ),
              ));
        }).toList(),
      ),
    ));
  }

  /// The `buildAssistanceWidget` function returns a MaterialButton widget with an icon and text for
  /// providing assistance.
  ///
  /// Args:
  ///   ontap (void Function()): The `buildAssistanceWidget` function you provided creates a
  /// MaterialButton widget with an icon and text inside a container. The `ontap` parameter is a function
  /// that is called when the button is tapped. You can pass a function to this parameter to define the
  /// behavior you want when the button is
  ///
  /// Returns:
  ///   A MaterialButton widget is being returned with an onPressed function that triggers the ontap
  /// function provided as a parameter. The button contains a Container with a BoxDecoration that gives it
  /// rounded corners and a semi-transparent background color. Inside the Container, there is a Row widget
  /// with an Icon and Text widget, displaying an outlined help icon and the text 'How can we help you?'
  /// respectively.
  buildAssistanceWidget(void Function() ontap) {
    return MaterialButton(
      onPressed: ontap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryColor.withOpacity(0.20),
          ),
          height: 70,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.help_outline_outlined,
                  color: AppColors.primaryColor, size: 25),
              const SizedBox(width: 10),
              Text(
                'How can we help you?',
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}
