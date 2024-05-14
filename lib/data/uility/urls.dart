class Urls {
  static const String _baseurl = 'https://craftybay.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseurl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseurl/VerifyLogin/$email/$otp';

  static String homeSlider() => '$_baseurl/ListProductSlider';

  static String category() => '$_baseurl/CategoryList';
  static String productList( String remarks) => '$_baseurl/ListProductByRemark/$remarks';
}
