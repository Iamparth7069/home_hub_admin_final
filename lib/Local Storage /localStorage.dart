import 'package:get_storage/get_storage.dart';

class LocalStorage{
  static final box = GetStorage();

  static String uid = "uId";
  static String onBoddingStatus = "onBodding";

  static String loginCheck = "login";

  static Future<void> setUserId({required String userId}) async {
    await box.write(uid, userId);
  }

  static Future getUserId() async {
    String userId = await box.read(uid);
    return userId;
  }


  static Future<void> setLoginStatus({required bool loginFlag}) async {
    await box.write(loginCheck, loginFlag);
  }

  static Future<bool> getLoginStatus() async {
    bool? check = await box.read(loginCheck);
    if (check == null) {
      // Handle the case when the key is not set or missing, by returning `true` as default
      return false;
    }
    return true;
  }


  static Future<void> setOnboddingStatus({required bool onFleg}) async {
    await box.write(onBoddingStatus, onFleg);
  }

  static Future<bool> getOnboddingStatus() async {
    bool? check = await box.read(onBoddingStatus);
    if (check == null) {
      return false;
    }
    return true;
  }

}