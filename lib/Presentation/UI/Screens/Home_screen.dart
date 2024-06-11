import 'package:craftybay/Presentation/State%20holders/Home_silder_controller.dart';
import 'package:craftybay/Presentation/State%20holders/product_controller.dart';
import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:craftybay/Presentation/UI/widgets/Home/Home_silder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../State holders/category_controller.dart';
import '../../State holders/main_navbottom_controlar.dart';
import '../widgets/Category_card.dart';
import '../widgets/Circulericonbutton.dart';
import '../widgets/Home/SectionHeader.dart';
import '../widgets/Home/product_Card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  CategoryController categoryController = Get.put(CategoryController());
  HomeSliderController sliderController = Get.put(HomeSliderController());
  ProductController productPopularController = Get.put(ProductController());
  ProductController productSpecialController = Get.put(ProductController());

  double padInt = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: SvgPicture.asset('assets/images/logo_nav.svg'),
        actions: [
          Circulericonbutton(
            tap: () {},
            data: Icons.person_outline,
          ),
          const SizedBox(
            width: 10,
          ),
          Circulericonbutton(tap: () {}, data: Icons.phone_sharp),
          const SizedBox(
            width: 10,
          ),
          Circulericonbutton(
            tap: () {},
            data: Icons.notifications_active_outlined,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0XFF07ADAE),
                    ),
                    hintText: 'Search'),
              ),
              const SizedBox(
                height: 10,
              ),
              //  Text('data')

              SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: GetBuilder<HomeSliderController>(
                      builder: (homeSliderController) {
                        if (homeSliderController.HomeSliderInProgress) {
                          return Center(
                            child: Shimmer.fromColors(
                              baseColor: colorPaletter.primaryColor,
                              highlightColor: Colors.white,
                              child: const Text(
                                'Please Wait..',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }
                        return HomeSlider(
                          slider: homeSliderController.slidermodel.data ?? [],
                        );
                      })),

              SelectHeader(
                  title: 'Categories',
                  Ontap: () {
                    Get.find<MainNavBottomController>().changeScreen(1);
                  }),
              SizedBox(
                height: 100,
                child: GetBuilder<CategoryController>(
                    builder: (categoryController) {
                      if (categoryController.categoryInProgress) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryController.categorymodel.data
                            ?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Category_card(
                            categoryData: categoryController.categorymodel
                                .data![index],
                          );
                        },
                      );
                    }),
              ),
              SelectHeader(
                title: 'Popular',
                Ontap: () {},
              ),

              SizedBox(
                height: 180,
                child: GetBuilder<ProductController>(
                    builder: (productController) {
                      if (productController.productInprogress) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productPopularController
                              .productPopulerModel.data?.length ??
                              0,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              productpopuler: productController
                                  .productPopulerModel.data![index],
                            );
                          });
                    }),
              ),

              SelectHeader(
                title: 'Special',
                Ontap: () {},
              ),

              SizedBox(
                height: 180,
                child:
                GetBuilder<ProductController>(builder: (specialController) {
                  if (specialController.productspecialInprogress) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productSpecialController.productSpecialModel
                          .data?.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          productpopuler: specialController
                              .productSpecialModel.data![index],
                        );
                      });
                }),
              ),
              SelectHeader(
                title: 'New',
                Ontap: () {},
              ),

              SizedBox(
                height: 180,
                child: GetBuilder<ProductController>(builder: (newProduct) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          productpopuler: newProduct.productSpecialModel.data![index],
                        );
                      });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
