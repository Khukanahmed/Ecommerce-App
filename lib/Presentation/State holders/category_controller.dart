
import 'package:craftybay/data/service/network_called.dart';
import 'package:get/get.dart';
import '../../data/model/category_model.dart';
import '../../data/model/network_respons.dart';
import '../../data/uility/urls.dart';

class CategoryController extends GetxController {
  bool _categoryInprogress = false;
  String _massage = '';
  CategoryModel _categorymodel = CategoryModel();

  CategoryModel get categorymodel => _categorymodel;

  bool get categoryInProgress => _categoryInprogress;

  String get Massage => _massage;

  Future<bool> getCategory() async {
    _categoryInprogress = true;
    update();
    final NetworkRespons respons =
        await NetworkCaller().getRequest(Urls.category());
    _categoryInprogress = false;
    if (respons.isSuccess) {
      _categorymodel = CategoryModel.fromJson(respons.responsJson ?? {});
      update();

      return true;

    } else {
      update();
      return false;
    }
  }
}
