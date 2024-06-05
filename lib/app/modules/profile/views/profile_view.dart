import 'package:delivery_boy/app/modules/profile/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

/// The `ProfileView` class is a Flutter widget that uses GetX for state management and displays the
/// `ProfileViewBody` within a Scaffold.
class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return const Scaffold(body: ProfileViewBody());
        });
  }
}
