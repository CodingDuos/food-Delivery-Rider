import 'package:delivery_boy/app/constants/constants_colors.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrderDetailsViewBody(),
    );
  }
}

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/map.png'), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50)),
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('images/onboard.png'),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            ListTile(
                              dense: true,
                              trailing: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle),
                                child:
                                    const Icon(Icons.call, color: Colors.white),
                              ),
                              title: const Text(
                                'Sahidul Islam',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: const Text(
                                'Delivery Boy',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [0, 1, 2, 3, 4]
                                    .map((e) => Icon(
                                          Icons.star,
                                          color: AppColors.primaryColor,
                                          size: 12,
                                        ))
                                    .toList(),
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 270,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(50)),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: 3,
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

                        return ListTile(
                          title: const Text('Address'),
                          subtitle: const Text('421 Duke Street , M54ader'),
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: colorReturn().withOpacity(0.20),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.location_history,
                              color: colorReturn(),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
}
