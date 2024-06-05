import 'package:get/get.dart';

class OrdersController extends GetxController {
  /// The line `List<Order> ordersList = orders;` is initializing a new list variable `ordersList` and
  /// assigning it the same values as the `orders` list. This means that `ordersList` will contain the
  /// same elements as the `orders` list at the point of initialization. Any changes made to the `orders`
  /// list after this assignment will not reflect in `ordersList` as it is a separate list with its own
  /// copy of the elements.
  List<Order> ordersList = orders;

  /// The line `List<String> ordersStatusTypesList = orderTypes;` is initializing a new list variable
  /// `ordersStatusTypesList` and assigning it the same values as the `orderTypes` list. This means that
  /// `ordersStatusTypesList` will contain the same elements as the `orderTypes` list at the point of
  /// initialization. Any changes made to `orderTypes` list after this assignment will not reflect in
  /// `ordersStatusTypesList` as it is a separate list with its own copy of the elements.
  List<String> ordersStatusTypesList = orderTypes;

  /// In the Dart code snippet provided, the line `var selectedOrderType = "All Orders".obs;` is using the
  /// `.obs` extension provided by the GetX package in Flutter.
  var selectedOrderType = "All Orders".obs;

  /// The function `updateSelectedOrderType` updates the selected order type with the provided value and
  /// triggers an update.
  ///
  /// Args:
  ///   orderType (String): The `updateSelectedOrderType` function takes a parameter `orderType` which is
  /// a string representing the type of order to be updated. This function updates the `selectedOrderType`
  /// value with the new `orderType` value and then triggers an update.
  updateSelectedOrderType(String orderType) {
    selectedOrderType.value = orderType;
    update();
  }
}

/// The `Order` class in Dart represents an order with properties such as name, picture, address,
/// delivery time, and delivery status.
class Order {
  String name;
  String picture;
  String address;
  String deliveryTime;
  bool isDelivered;

  Order({
    required this.name,
    required this.picture,
    required this.address,
    required this.deliveryTime,
    required this.isDelivered,
  });
}

/// List of orders.
///
/// This list contains instances of the [Order] class, representing different orders.
/// Each order has a name, picture, address, delivery time, and delivery status.

List<Order> orders = [
  Order(
    name: "Margherita Pizza",
    picture: 'images/pizza.png',
    address: "123 Main Street, Cityville",
    deliveryTime: "2024-03-02 14:30:00",
    isDelivered: false,
  ),
  Order(
    name: "Pepperoni Pizza",
    picture: 'images/burger.png',
    address: "456 Oak Avenue, Townsville",
    deliveryTime: "2024-03-02 15:45:00",
    isDelivered: true,
  ),
  Order(
    name: "xtra Cheese Pizza",
    picture: 'images/pizza.png',
    address: "789 Pine Lane, Villagetown",
    deliveryTime: "2024-03-02 16:00:00",
    isDelivered: false,
  ),
  Order(
    name: "Zucchini Pizza",
    picture: 'images/burger.png',
    address: "101 Cedar Street, Hamletville",
    deliveryTime: "2024-03-02 17:15:00",
    isDelivered: true,
  ),
  Order(
    name: "Artichoke Pizza",
    picture: 'images/pizza.png',
    address: "202 Willow Avenue, Boroughville",
    deliveryTime: "2024-03-02 18:30:00",
    isDelivered: false,
  ),
  Order(
    name: "Eva Brown",
    picture: 'images/burger.png',
    address: "303 Birch Road, Countryside",
    deliveryTime: "2024-03-02 19:45:00",
    isDelivered: true,
  ),
  Order(
    name: "Pizza Afghani",
    picture: 'images/pizza.png',
    address: "404 Maple Lane, Suburbia",
    deliveryTime: "2024-03-02 20:00:00",
    isDelivered: false,
  ),
  Order(
    name: "Zinger Burger",
    picture: 'images/burger.png',
    address: "505 Redwood Street, Outskirts",
    deliveryTime: "2024-03-02 21:15:00",
    isDelivered: true,
  ),
  Order(
    name: "Lamb 1kg Karahai",
    picture: 'images/pizza.png',
    address: "606 Elm Avenue, Riverside",
    deliveryTime: "2024-03-02 22:30:00",
    isDelivered: false,
  ),
  Order(
    name: "Beef Behari Boti",
    picture: 'images/burger.png',
    address: "707 Oak Lane, Mountainside",
    deliveryTime: "2024-03-02 23:45:00",
    isDelivered: true,
  ),
];

/// A list of order types.
///
/// This list contains various types of orders such as "New Orders", "Completed",
/// "Uncompleted", "In Progress", "Pending", "Cancelled", "On Hold", "Shipped",
/// "Delivered", and "Reorder".
List<String> orderTypes = [
  'All Orders',
  'New Orders',
  "Completed",
  "Uncompleted",
  "In Progress",
  "Pending",
  "Cancelled",
  "On Hold",
  "Shipped",
  "Delivered",
  'Reorder',
];
