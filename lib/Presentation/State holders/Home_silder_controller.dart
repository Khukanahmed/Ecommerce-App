import 'package:craftybay/data/model/slider_model.dart';
import 'package:craftybay/data/service/network_called.dart';
import 'package:get/get.dart';

import '../../data/model/network_respons.dart';
import '../../data/uility/urls.dart';

class HomeSliderController extends GetxController {
  bool _homesilderInprogress = false;
  String _massage = '';
  SliderModel _sliderModel = SliderModel();

  SliderModel get slidermodel => _sliderModel;

  bool get HomeSliderInProgress => _homesilderInprogress;

  String get Massage => _massage;

  Future<bool> getHomeSlider() async {
    _homesilderInprogress = true;
    update();
    final NetworkRespons respons =
        await NetworkCaller().getRequest(Urls.homeSlider());
    _homesilderInprogress = false;
    if (respons.isSuccess) {
      _sliderModel = SliderModel.fromJson(respons.responsJson ?? {});
      update();
      //_massage = respons.responsJson!['data'] ?? '';
      //_massage=respons.responsJson!['id']??'';
      return true;
    } else {
      update();
      return false;
    }
  }
}
