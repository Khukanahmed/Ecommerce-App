import 'package:get/get.dart';

class MainNavBottomController extends GetxController {
  int currentSelectIndex = 0;
  void changeScreen(int index) {
    currentSelectIndex = index;
    update();
  }
}
