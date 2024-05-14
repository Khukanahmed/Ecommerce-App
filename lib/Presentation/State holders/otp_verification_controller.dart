import 'package:craftybay/Presentation/UI/Screens/auth/auth_controller.dart';
import 'package:craftybay/data/model/network_respons.dart';
import 'package:craftybay/data/service/network_called.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/uility/urls.dart';

class OtpVerifyController extends GetxController {
  bool _otpverifyinprogress = false;

  String _massage = '';

  bool get otpverifyInprograss => _otpverifyinprogress;

  String get Massage => _massage;

  Future<bool> OtpVerify(email, otp) async {
    _otpverifyinprogress = true;
    NetworkRespons respons =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _otpverifyinprogress = false;
    if (respons.isSuccess) {
      await AuthController.setAccessToken(respons.responsJson!['data']);

      return true;
    } else {
      return false;
    }
  }
}
