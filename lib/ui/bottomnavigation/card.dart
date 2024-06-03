import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/components/textComponents.dart';

import 'package:getx_practice/utils/color.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controlller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'My Cards',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Here are your available cards:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BankCard(
                    cardHolder: 'Zainab Ali',
                    cardNumber: '1234 5678 9012 3456',
                    validThru: '12/24',
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BankCard(
                    cardHolder: 'Zainab Ali',
                    cardNumber: '2345 6789 0123 4567',
                    validThru: '11/25',
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Text(
              'Transactions',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controlller.nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Enter Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: controlller.priceController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Enter Price',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: controlller.addText,
                  child: const Text('Submit Entry'),
                ),
              ],
            ),
          ),
          GetBuilder<HomeController>(
            builder: (controlller) {
              return Column(
                children: controlller.historyData.map((data) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.receipt,
                                size: 15, color: Colors.black54),
                            const SizedBox(width: 10),
                            Text(
                              data['name']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          data['price']!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  InfoCard(
                    title: 'Bill',
                    icon: Icons.receipt,
                    price: '\$120.00',
                  ),
                  InfoCard(
                    title: 'Shopping',
                    icon: Icons.shopping_cart,
                    price: '\$80.00',
                  ),
                  InfoCard(
                    title: 'Monthly Fee',
                    icon: Icons.receipt_sharp,
                    price: '\$60.00',
                  ),
                  InfoCard(
                    title: 'Pay Contact',
                    icon: Icons.account_circle_outlined,
                    price: '\$40.00',
                  ),
                  InfoCard(
                    title: 'Education',
                    icon: Icons.cast_for_education_rounded,
                    price: '\$93.40',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BankCard extends StatelessWidget {
  final String cardHolder;
  final String cardNumber;
  final String validThru;
  final Color color;

  const BankCard({
    super.key,
    required this.cardHolder,
    required this.cardNumber,
    required this.validThru,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cardHolder,
              style: TextStyles.cardHolder,
            ),
            const SizedBox(height: 10),
            Text(
              cardNumber,
              style: TextStyles.cardNumber,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'VALID THRU',
                      style: TextStyles.validThruLabel,
                    ),
                    Text(
                      validThru,
                      style: TextStyles.validThru,
                    ),
                  ],
                ),
                const Icon(
                  Icons.credit_card,
                  color: Colors.white70,
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String price;

  const InfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: Colors.black54),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<Map<String, String>> historyData = [];

  void addText() {
    String nameValue = nameController.text;
    String priceValue = priceController.text;
    if (nameValue.isNotEmpty && priceValue.isNotEmpty) {
      Get.snackbar("Text Status", "Entry Submitted",
          snackPosition: SnackPosition.TOP);
      historyData.add({"name": nameValue, "price": priceValue});
      update();
      print(historyData);
    } else {
      Get.snackbar("Error", "Name and price cannot be empty",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  void adddText() {
    if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {
      final String name = nameController.text;
      final String price = '\$${priceController.text}';

      historyData.add({'name': name, 'price': price});

      update();
      print(historyData);
      nameController.clear();
      priceController.clear();
    }
  }
}
