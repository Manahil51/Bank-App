import 'package:flutter/material.dart';
import 'package:getx_practice/components/textComponents.dart';

import 'package:getx_practice/utils/color.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Text('MY BANK', style: TextStyles.header),
        actions: const [],
      ),
      backgroundColor: AppColors.white,
    );
  }
}
