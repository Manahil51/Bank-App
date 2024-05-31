import 'package:get/get.dart';
import 'package:getx_practice/ui/login/login.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    navigateToLogin();
  }

  Future<void> navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => const LoginPage());
  }
}
