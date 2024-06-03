import 'package:flutter/material.dart';
import 'package:getx_practice/utils/color.dart';

class TextComponent extends StatelessWidget {
  final String textComponentValue;
  const TextComponent({super.key, required this.textComponentValue});

  @override
  Widget build(BuildContext context) {
    return Text(
      textComponentValue,
      style: TextStyle(color: Colors.black, fontSize: 33),
    );
  }
}

class TextStyles {
  static const TextStyle header = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle subHeader = TextStyle(
    fontSize: 16,
    color: AppColors.white,
  );

  static const TextStyle inputText = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 20,
    color: AppColors.white,
  );

  static const TextStyle linkText = TextStyle(
    fontSize: 16,
    color: AppColors.purple,
  );
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    color: AppColors.secondary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );

  static const TextStyle splashText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static const TextStyle cardNumber = TextStyle(
    color: AppColors.white,
    fontSize: 16,
  );

  static const TextStyle validThruLabel = TextStyle(
    color: Colors.white70,
    fontSize: 10,
  );

  static const TextStyle validThru = TextStyle(
    color: AppColors.white,
    fontSize: 14,
  );

  static const TextStyle bottomNavText = TextStyle(
    color: AppColors.white,
  );
  static const TextStyle cardHolder = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
}

class TextsComponent extends StatelessWidget {
  final String textComponentValue;
  const TextsComponent({super.key, required this.textComponentValue});

  @override
  Widget build(BuildContext context) {
    return Text(
      textComponentValue,
      style: TextStyle(color: AppColors.white, fontSize: 33),
    );
  }
}
