import 'package:delivery_boy/app/constants/constants_colors.dart';
import 'package:delivery_boy/app/modules/orders/controllers/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_none))
          ],
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        body: const HomePageViewBody());
  }
}

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  Color colorReturn() {
                    if (index == 0) {
                      return Colors.green;
                    } else if (index == 1) {
                      return Colors.red;
                    } else if (index == 2) {
                      return Colors.blue;
                    } else if (index == 3) {
                      return Colors.orange;
                    }
                    return Colors.grey.shade200;
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: colorReturn().withOpacity(0.20),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.card_giftcard_outlined,
                              size: 30, color: colorReturn()),
                          const Text('COmplete Orders'),
                          const Text(
                            '27',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'New Orders',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        buildOrderItemsWidget(orders)
      ],
    );
  }

  buildOrderItemsWidget(List<Order> orders) {
    /// The above Dart code is creating a ListView.builder widget that displays a list of orders. Each
    /// order is represented as a container with information such as the order picture, name, address,
    /// delivery time, and delivery status (delivered or pending). The layout includes images, text,
    /// icons, and styling to present the order details in a visually appealing way. The ListView
    /// dynamically builds the list based on the orders data provided.
    return Expanded(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
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
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 150,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.red,
                                  ),
                                  child: const Center(
                                    child: Text('Pending',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  width: 150,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green,
                                  ),
                                  child: const Center(
                                    child: Text('Accept',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
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
