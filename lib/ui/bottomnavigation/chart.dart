import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/components/textComponents.dart';
import 'package:getx_practice/utils/color.dart';

class ChartView extends StatelessWidget {
  ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final CounterController c = Get.put(CounterController());
    print("Calling Build Method");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/images/bank.png',
              height: 60, // adjust height as needed
            ),
            const SizedBox(width: 10),
            const Text(
              'MY BANK',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<HomeController>(builder: (homeController) {
              return Center(
                  child: TextComponent(
                      textComponentValue: "${homeController.counterValue}"));
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBar(0.3, 'Jan'),
                    _buildBar(0.5, 'Feb'),
                    _buildBar(0.4, 'Mar'),
                    _buildBar(0.5, 'April'),
                    _buildBar(0.3, 'May'),
                    _buildBar(0.2, 'June'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.amountValue,
                      decoration: InputDecoration(
                        hintText: 'Enter amount',
                        hintStyle: const TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white24,
                      ),
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                    ),
                    Obx(() => Center(
                            child: TextComponent(
                          textComponentValue: "${controller.counterValue}",
                        ))),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            controller.addAmount();
                          },
                          child: const Text("Credit"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            controller.subAmount();
                          },
                          child: const Text("Debit"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: GetBuilder<HomeController>(builder: (contexta) {
                        return ListView.builder(
                          itemCount: controller.historyData.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                "${controller.historyData[index]["amount"]}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: controller.historyData[index]["type"] ==
                                      "Debit"
                                  ? const Icon(Icons.arrow_downward_outlined,
                                      color: Colors.red)
                                  : const Icon(Icons.arrow_upward_outlined,
                                      color: Colors.green),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: c.increment,
      ),
    );
  }
}

Widget _buildBar(double heightFraction, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 50,
        height: 400 * heightFraction,
        color: Colors.black,
      ),
      const SizedBox(height: 5),
      Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    ],
  );
}

class Other extends StatelessWidget {
  final CounterController c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}

class HomeController extends GetxController {
  var counterValue = 0.obs;
  TextEditingController amountValue = TextEditingController();
  List<Map<String, dynamic>> historyData = [];

  void addValue() {
    counterValue++;
    update();
    print(counterValue);
  }

  void addAmount() {
    print(amountValue.text);
    counterValue.value = counterValue.value + int.parse(amountValue.text);
    Get.snackbar("Amount Status", "Amount Added",
        snackPosition: SnackPosition.TOP);
    historyData.add({"amount": amountValue.text, "type": "Credit"});
    update();
    print(historyData);
  }

  void subAmount() {
    print(amountValue.text);
    counterValue.value = counterValue.value - int.parse(amountValue.text);
    historyData.add({"amount": amountValue.text, "type": "Debit"});
    print(historyData);
    update();
  }
}

class CounterController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}

class AddView extends StatelessWidget {
  AddView({super.key});
  HomeController homeControl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Obx(() => TextComponent(
              textComponentValue:
                  "${homeControl.counterValue.value} ${Get.arguments}")),
          ElevatedButton(
              onPressed: () {
                Get.back(result: "I am Back");
              },
              child: const Text("back from this"))
        ],
      )),
    );
  }
}
