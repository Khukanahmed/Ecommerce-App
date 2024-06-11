import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import '../model/network_respons.dart';

class NetworkCaller {
  Future<NetworkRespons> getRequest(String url) async {
    try {
      Response response = await get(
        Uri.parse(url),
      );
      log(response.statusCode.toString());

      var logger = Logger();

      final decodejson = jsonDecode(response.body);
      logger.d(decodejson['data']);
     // logger.d(decodejson['data'][0]['title']);//

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['msg'] == 'success') {
        return NetworkRespons(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        // gotoLogin();
      } else {
        return NetworkRespons(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkRespons(false, -1, null);
  }

  Future<NetworkRespons> postReqeust(String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      Response response = await post(Uri.parse(url),
          headers: {'Content-type': 'Application/json'},
          body: jsonEncode(body));
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['status'] == 'success') {
        return NetworkRespons(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          //gotologin();
        }
      } else {
        return NetworkRespons(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkRespons(false, -1, null);
  }
}
