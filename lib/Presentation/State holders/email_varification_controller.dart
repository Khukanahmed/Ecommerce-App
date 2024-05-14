import 'package:craftybay/data/service/network_called.dart';
import 'package:get/get.dart';
import '../../data/model/network_respons.dart';
import '../../data/uility/urls.dart';

class EmailVerificationController extends GetxController {
  bool _emailVerificationInprogress = false;
  String _massage = '';

bool get emailVerificationInprogress =>_emailVerificationInprogress;

  String get Massage => _massage;

  Future<bool> verfiyEmail(String  email) async {
    _emailVerificationInprogress = true;
    update();
    final NetworkRespons respons =
        await NetworkCaller().getRequest(Urls.verifyEmail(email));
    _emailVerificationInprogress = false;
    if (respons.isSuccess) {
      _massage=respons.responsJson!['data']??'';
      return true;
    } else {
      return false;
    }
  }
}
