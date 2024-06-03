import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:getx_practice/ui/bottomnavigation/card.dart';
import 'package:getx_practice/ui/bottomnavigation/chart.dart';
import 'package:getx_practice/ui/bottomnavigation/payment.dart';
import 'package:getx_practice/utils/color.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  List<Map<String, String>> cards = [
    {'title': 'Balance', 'amount': '\$800.65', 'change': '+\$20.50'},
    {'title': 'Income', 'amount': '\$400.35', 'change': '-\$70.50'},
    {'title': 'Expense', 'amount': '\$950.05', 'change': '+\$50'},
  ];

  void _navigateTo(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const HomeView();
        break;
      case 1:
        page = ChartView();
        break;
      case 2:
        page = const CardView();
        break;
      case 3:
        page = const PaymentView();
        break;
      default:
        page = const HomeView();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _showAddWidgetDialog(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    final changeController = TextEditingController();

    Get.defaultDialog(
      title: 'Add New Transaction',
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'for what'),
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'total Amount'),
          ),
          TextField(
            controller: changeController,
            decoration: const InputDecoration(labelText: 'Change recived'),
          ),
        ],
      ),
      textCancel: 'Cancel',
      textConfirm: 'Add',
      onCancel: () {},
      onConfirm: () {
        if (titleController.text.isNotEmpty &&
            amountController.text.isNotEmpty &&
            changeController.text.isNotEmpty) {
          final newCard = {
            'title': titleController.text,
            'amount': amountController.text,
            'change': changeController.text,
          };
          setState(() {
            cards.add(newCard);
          });
          Get.back();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                accountName: Text(
                  "Manahil Jawed",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("Manahiljawed436@gmail.com"),
                currentAccountPictureSize: Size.square(40),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Text(
                    "M",
                    style: TextStyle(fontSize: 30.0, color: Colors.black),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.purple),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.purple),
              title: const Text(' Help Center '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.purple),
              title: const Text(' Pin setting'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.perm_device_information_sharp,
                  color: Colors.purple),
              title: const Text(' Addition Information '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.purple),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.purple),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.black,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.bar_chart,
                  text: 'Transfer chart',
                ),
                GButton(
                  icon: Icons.credit_card_sharp,
                  text: ' My cards',
                ),
                GButton(
                  icon: Icons.compare_arrows_outlined,
                  text: 'transaction',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                _navigateTo(index);
              },
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius:
                    BorderRadius.circular(20), // Adjust border radius as needed
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Good morning',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Manahil Jawed',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: cards.take(2).map((card) {
                        return _buildCard(
                            card['title']!, card['amount']!, card['change']!);
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ...cards.skip(2).map((card) {
                          return _buildCard(
                              card['title']!, card['amount']!, card['change']!);
                        }).toList(),
                        _buildAddWidgetCard(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String amount, String change) {
    bool isPositiveChange = change.startsWith('+');
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.purple)),
            const SizedBox(height: 10),
            Text(amount,
                style: const TextStyle(color: Colors.purple, fontSize: 18)),
            const SizedBox(height: 5),
            Text(
              change,
              style: TextStyle(
                color: isPositiveChange ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddWidgetCard(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _showAddWidgetDialog(context),
        child: Container(
          height: 110,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.add, color: Colors.white70),
        ),
      ),
    );
  }
}
