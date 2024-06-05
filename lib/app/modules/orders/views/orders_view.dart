import 'package:delivery_boy/app/modules/orders/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/orders_controller.dart';

/// The `OrdersView` class defines the UI structure for displaying orders in a Flutter application using
/// the GetX package.
class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// This code snippet is defining the UI for the `OrdersView` widget in a Flutter application using
    /// the GetX package. Here's what it does:
    return GetBuilder<OrdersController>(
        init: OrdersController(),
        builder: (controller) {
          /// This code snippet is defining the UI structure for the `OrdersView` widget in a Flutter application.
          /// Here's what it does:
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text('Orders'),
                centerTitle: true,
              ),
              body: const OrdersViewBody());
        });
  }
}
