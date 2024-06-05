import 'package:delivery_boy/app/constants/constants_colors.dart';
import 'package:delivery_boy/app/modules/orders/controllers/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The `OrdersViewBody` class in Dart is a StatelessWidget that displays a list of orders with
/// different status types and order details.
class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    /// The code snippet you provided is using the `GetBuilder` widget from the GetX package in Flutter to
    /// listen to changes in the `OrdersController` and rebuild the widget whenever the state of the
    /// controller changes. Here's a breakdown of what the code is doing:
    return GetBuilder<OrdersController>(builder: (controller) {
      /// The line `List<Order> orders = controller.ordersList;` is declaring a variable `orders` of type
      /// `List<Order>` and assigning it the value of `controller.ordersList`. This statement is
      /// retrieving the list of orders from the `OrdersController` instance `controller` and storing it
      /// in the `orders` variable for further processing and display in the `OrdersViewBody` widget.
      List<Order> orders = controller.ordersList;

      /// The code snippet `return Column(...)` is defining the layout structure of the widget being built by
      /// the `OrdersViewBody` class. It creates a `Column` widget with two children:
      return Column(
        children: [
          /// The `buildOrdersStatusTypesWidgets(controller)` function is responsible for creating a
          /// horizontal list of order status types with interactive selection functionality.
          buildOrdersStatusTypesWidgets(controller),

          /// The `buildOrderItemsWidget(orders)` function is responsible for generating a list view of order
          /// items based on the list of `Order` objects passed to it. In the provided code snippet, this function
          /// is called within the `Column` widget's children list in the `build` method of the `OrdersViewBody`
          /// class.
          buildOrderItemsWidget(orders),
        ],
      );
    });
  }

  /// The function `buildOrdersStatusTypesWidgets` creates a horizontal list of order status types with
  /// interactive selection functionality.
  ///
  /// Args:
  ///   controller (OrdersController): The `controller` parameter in the `buildOrdersStatusTypesWidgets`
  /// function is an instance of the `OrdersController` class. This controller likely contains data
  /// related to orders and their status types, as well as methods to update the selected order type. The
  /// function builds a widget that displays a list of
  ///
  /// Returns:
  ///   A widget that displays a horizontal list of order status types with selectable options. Each
  /// option is displayed as a clickable container with text representing the order status type. The
  /// selected order status type is highlighted with a different background color and bold text. Tapping
  /// on an option updates the selected order status type.
  buildOrdersStatusTypesWidgets(OrdersController controller) {
    /// This code snippet is defining a widget that displays a horizontal list of order status types with
    /// interactive selection functionality. Here's a breakdown of what the code is doing:
    return SizedBox(
      height: 55,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.ordersStatusTypesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isSelected = controller.selectedOrderType.value ==
                controller.ordersStatusTypesList[index];
            String orderStatus = controller.ordersStatusTypesList[index];
            Color backgroundColor =
                isSelected ? AppColors.primaryColor : Colors.grey[200] as Color;
            Color textColor = isSelected ? Colors.white : Colors.black;
            return Padding(
              padding:
                  const EdgeInsets.only(right: 4, left: 4, top: 3, bottom: 3),
              child: InkWell(
                onTap: () {
                  controller.updateSelectedOrderType(orderStatus);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border.all(color: Colors.grey[300] as Color),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      orderStatus,
                      style: TextStyle(
                          color: textColor,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w400),
                    ),
                  )),
                ),
              ),
            );
          }),
    );
  }

  /// The `buildOrderItemsWidget` function generates a list view of order items with details like name,
  /// address, delivery time, and delivery status.
  ///
  /// Args:
  ///   orders (List<Order>): The `buildOrderItemsWidget` function you provided is a Flutter widget that
  /// creates a list of order items based on the list of `Order` objects passed to it. Each order item is
  /// displayed in a container with details like the order picture, name, address, delivery time, and
  /// delivery status.
  ///
  /// Returns:
  ///   The `buildOrderItemsWidget` function returns an `Expanded` widget containing a `ListView.builder`.
  /// The builder generates a list of order items based on the provided list of `Order` objects. Each
  /// order item is displayed within a `Container` with specific styling and layout, showing the order's
  /// picture, name, address, delivery time, and delivery status (delivered or pending).
  buildOrderItemsWidget(List<Order> orders) {
    /// The above Dart code is creating a ListView.builder widget that displays a list of orders. Each
    /// order is represented as a container with information such as the order picture, name, address,
    /// delivery time, and delivery status (delivered or pending). The layout includes images, text,
    /// icons, and styling to present the order details in a visually appealing way. The ListView
    /// dynamically builds the list based on the orders data provided.
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: orders.length,
          itemBuilder: (context, index) {
            Order order = orders[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey[200] as Color),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset(order.picture, fit: BoxFit.contain),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(order.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  size: 18,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.70)),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Text(
                                order.address,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.timelapse_outlined,
                                  size: 18,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.70)),
                              const SizedBox(width: 10),
                              Text(
                                order.deliveryTime,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(order.isDelivered ? 'Delivered' : 'Pending',
                                  style: TextStyle(
                                      color: order.isDelivered
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
