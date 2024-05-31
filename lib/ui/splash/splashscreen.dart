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
          backgroundColor: AppColors.black,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'data:image/png;base64,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',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 40),
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
