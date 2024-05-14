class NetworkRespons {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? responsJson;

  NetworkRespons(this.isSuccess, this.statusCode, this.responsJson);
}
//Future<void> gotoLogin() async {
// await AuthUtility.clearUserInfo();
//  Navigator.pushAndRemoveUntil(
//    TaskManagerApp.globalKey.currentContext!,
//
//  )
//}
