import 'package:craftybay/Presentation/State%20holders/category_controller.dart';
import 'package:craftybay/Presentation/State%20holders/main_navbottom_controlar.dart';
import 'package:craftybay/Presentation/UI/Screens/Home_screen.dart';
import 'package:craftybay/Presentation/UI/Screens/cart_screen.dart';
import 'package:craftybay/Presentation/UI/Screens/wish_list.dart';
import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../State holders/Home_silder_controller.dart';
import 'Product_list_screen.dart';

class NavigationBarButton extends StatefulWidget {
  const NavigationBarButton({super.key});

  @override
  State<NavigationBarButton> createState() => _NavigationBarButtonState();
}

class _NavigationBarButtonState extends State<NavigationBarButton> {
  HomeSliderController HomeController=Get.put(HomeSliderController());


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getHomeSlider();
      Get.find<CategoryController>().getCategory();

    });
    // TODO: implement initState
    super.initState();
  }

  MainNavBottomController mainNavbottomController =
      Get.put(MainNavBottomController());
  final List<Widget> _screens = [
    const HomePage(),
    const Categorise_list_prooduct(),
    const CardScreen(),
    const Wish_list_prooduct(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavBottomController>(builder: (Controller) {
      return Scaffold(
        body: _screens[Controller.currentSelectIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: colorPaletter.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: Controller.currentSelectIndex,
          onTap: Controller.changeScreen,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Categoris'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_giftcard_rounded), label: 'Wishlist')
          ],
        ),
      );
    });
  }
}
