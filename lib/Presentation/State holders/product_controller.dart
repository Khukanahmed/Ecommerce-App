import 'package:craftybay/data/model/network_respons.dart';
import 'package:craftybay/data/model/product_model.dart';
import 'package:craftybay/data/service/network_called.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/uility/urls.dart';

class ProductController extends GetxController {
  bool _ProductPopulerInProgress = false;
  String _massage = '';
  ProductModel _productpopulerModel = ProductModel();

  bool get productInprogress => _ProductPopulerInProgress;

  String get massage => _massage;

  ProductModel get productPopulerModel => _productpopulerModel;

  Future<bool> getPopularProduct() async {
    _ProductPopulerInProgress = true;
    update();
    NetworkRespons respons =
        await NetworkCaller().getRequest(Urls.productList('popular'));
    _ProductPopulerInProgress = false;
    if (respons.isSuccess) {
      _productpopulerModel = ProductModel.fromJson(respons.responsJson ?? {});
      update();

      return true;
    } else {
      update();
      return false;
    }
  }
}
