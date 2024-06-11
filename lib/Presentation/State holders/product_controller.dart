import 'package:craftybay/data/model/network_respons.dart';
import 'package:craftybay/data/model/product_model.dart';
import 'package:craftybay/data/service/network_called.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../data/uility/urls.dart';

class ProductController extends GetxController {
  bool _ProductPopulerInProgress = false;
  bool _ProductSpecialInProgress = false;
  bool _ProductNewInProgress = false;

  String _massage = '';
  ProductModel _productpopulerModel = ProductModel();
  ProductModel _productspecialModel = ProductModel();
  ProductModel _productsNewModel = ProductModel();

  bool get productInprogress => _ProductPopulerInProgress;
  bool get productspecialInprogress => _ProductSpecialInProgress;
  bool get ProductNewInProgress => _ProductNewInProgress;

  String get massage => _massage;

  ProductModel get productPopulerModel => _productpopulerModel;
  ProductModel get productSpecialModel => _productspecialModel;
  ProductModel get productsNewModel => _productsNewModel;

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
      _massage = 'popular product loading fail';
      return false;
    }
  }

  Future<bool> getSpecialProduct() async {
    _ProductSpecialInProgress = true;
    update();
    NetworkRespons respons =
        await NetworkCaller().getRequest(Urls.productList('special'));
    _ProductSpecialInProgress = false;
    if (respons.isSuccess) {
      _productspecialModel = ProductModel.fromJson(respons.responsJson ?? {});
      update();

      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getNewProduct() async {
    _ProductSpecialInProgress = true;
    update();
    NetworkRespons respons =
        await NetworkCaller().getRequest(Urls.productList('New'));
    _ProductSpecialInProgress = false;
    if (respons.isSuccess) {
      _productspecialModel = ProductModel.fromJson(respons.responsJson ?? {});
      update();

      return true;
    } else {
      update();
      return false;
    }
  }
}
