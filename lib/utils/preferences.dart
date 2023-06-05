class UserPrefs {
  static const String keyuserlogin = "userlogin";

  ///signup
  static const String keyuseverify = "userverify";
  static const String keyemail = "email";
  static const String keyusertype = "type";
  static const String keyDeviceToken = "deviceToken";
  static const String keyutoken = "token";
  static String selectedadd = "";
  static int select = 0;

  ///addBusinessDetail
  static const String keybusinessName = "businessName";
  static const String keybusinessNumber = "businessNumber";
  static const String keyaddress = "address";
  static const String keycountry = "country";
  static const String keyprovince = "province";
  static const String keystreet_address = "street_address";
  static const String keyapartment = "apartment";
  static const String keycity = "city";
  static const String keypost_code = "post_code";
  static const String keylalatitude = "lalatitude";
  static const String keylongitude = "longitude";

  static const String keyisserviceprovide = "isserviceprovide";
  // Future<void> setuserlogin(String radiovalue)async {
  //
  //    SharedPreferences prefs = await SharedPreferences.getInstance();
  //    prefs.setBool('userlogin',true);
  //    prefs.setString(keyusertype,radiovalue);
  //    print("userlogin  :  ${prefs.getBool('userlogin')}");
  // }
  // Future<bool>getuserlogindetail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Userdetail.userloginstatus=prefs.getBool(keyuserlogin) ?? false;
  //   Userdetail.uservertypestatus=prefs.getString(keyusertype)?? "";
  //    print("userlogin  :  ${ (Userdetail.userloginstatus)}");
  //    return Userdetail.userloginstatus;
  // }

  /// email verify
  //  Future<void> setverify(String vemail) async {
  //
  //    SharedPreferences prefs = await SharedPreferences.getInstance();
  //    prefs.setBool('userverify',true);
  //    prefs.setString(keyemail,vemail);
  //    Userdetail.userverifytatus=prefs.getBool(keyuseverify) ?? false;
  //    Userdetail.userverifyemailstatu= prefs.getString(keyemail)?? "";
  //    print('prefrenuserverify :${prefs.setBool('userverify', true)}');
  //
  //  }
  //  Future<bool>getuserverify() async {
  //    SharedPreferences prefs = await SharedPreferences.getInstance();
  //    Userdetail.userverifytatus=prefs.getBool(keyuseverify) ?? false;
  //    Userdetail.userverifyemailstatu= prefs.getString(keyemail)?? "";
  //    print('userverify,${(Userdetail.userverifytatus)}');
  //    return Userdetail.userverifytatus;
  //  }
}
