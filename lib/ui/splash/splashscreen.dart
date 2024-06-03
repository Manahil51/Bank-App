import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/components/textComponents.dart';
import 'package:getx_practice/controllers/splash.controller.dart';
import 'package:getx_practice/utils/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/bank.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome to BankApp',
                  style: TextStyles.splashText,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
