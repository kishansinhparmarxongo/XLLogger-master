import 'package:hive/hive.dart';

class PrefBox {
  static PrefBox _instance;
  static Box box;
  static const KEY_CURRENCY_SYMBOL = "currency_symbol";
  static const KEY_IS_LOGIN = "is_login";

  //static const KEY_USER_ID = "user_id";
  static const KEY_PARENT_PAYLOAD = "parent_payload";
  static const KEY_PARENT_ID = "parent_id";
  static const KEY_PARENT_FIRST_NAME = "parent_first_name";
  static const KEY_PARENT_LAST_NAME = "parent_last_name";
  static const KEY_PARENT_IMAGE = "parent_image";
  static const KEY_PARENT_MOBILE = "parent_mobile";
  static const KEY_PARENT_MOBILE_COUNTRY_CODE = "parent_mobile_country_code";
  static const KEY_PARENT_MOBILE_VERIFIED = "parent_mobile_verified";

  static const KEY_DEFAULT_LAN = "default_lan";
  static const KEY_SCHOOL_ID = "school_id";
  static const KEY_DEFAULT_LAN_CODE = "default_lan_code";
  static const KEY_CHILD_PAYLOAD = "child_payload";
  static const KEY_CHILD_ID = "child_id";
  static const KEY_CHILD_ADMISSION_NO = "child_admission_no";
  static const KEY_CHILD_NAME = "child_name";
  static const KEY_CHILD_IMAGE = "child_image";
  static const KEY_CHILD_SCHOOL_NAME = "child_school_name";
  static const KEY_LAST_LAT = "last_lat";
  static const KEY_LAST_LNG = "last_lng";
  static const KEY_DEVICE_PIXEL_RATIO = "device_pixel_ratio";
  static const KEY_FCM_TOKEN = "device_id";
  static const KEY_IS_FIRST_TIME_LOGIN = "first_time_login";
  static const KEY_DEFAULT_CARD_ID = "default_card";
  static var kPrefBox = "default_card";

  static Future<PrefBox> getInstance() async {
    if (_instance == null) {
      _instance = PrefBox();
    }

    if (!Hive.isBoxOpen(kPrefBox)) {
      box = await Hive.openBox(kPrefBox);
    } else {
      box = Hive.box(kPrefBox);
    }

    return _instance;
  }

  bool get isLogin {
    return box.get(KEY_IS_LOGIN) ?? false;
  }

  set isLogin(bool flag) {
    box.put(KEY_IS_LOGIN, flag);
  }

  // bool get isFirstTimeLogin {
  //   return box.get(KEY_IS_FIRST_TIME_LOGIN) ?? false;
  // }

  // set isFirstTimeLogin(bool flag) {
  //   box.put(KEY_IS_FIRST_TIME_LOGIN, flag);
  // }

  String get fcmToken {
    return box.get(KEY_FCM_TOKEN) ?? "";
  }

  set fcmToken(String fcmToken) {
    box.put(KEY_FCM_TOKEN, fcmToken);
  }

  String get defaultLanCode {
    return box.get(KEY_DEFAULT_LAN_CODE) ?? "en";
  }

  set defaultLanCode(String defaultLanCode) {
    box.put(KEY_DEFAULT_LAN_CODE, defaultLanCode);
  }

  String get defaultLan {
    return box.get(KEY_DEFAULT_LAN) ?? "English";
  }

  set defaultLan(String defaultLan) {
    box.put(KEY_DEFAULT_LAN, defaultLan);
  }

  String get childSchoolId {
    return box.get(KEY_SCHOOL_ID) ?? "USE158736166761";
  }

  set childSchoolId(String defaultLan) {
    box.put(KEY_SCHOOL_ID, defaultLan);
  }

  String get currencySymbol {
    return box.get(KEY_CURRENCY_SYMBOL) ?? "\$";
  }

  set currencySymbol(String defaultLan) {
    box.put(KEY_CURRENCY_SYMBOL, defaultLan);
  }

  num get lastLat {
    return box.get(KEY_LAST_LAT) ?? 0.0;
  }

  set lastLat(num lastLat) {
    box.put(KEY_LAST_LAT, lastLat);
  }

  num get lastLng {
    return box.get(KEY_LAST_LNG) ?? 0.0;
  }

  set lastLng(num lastLng) {
    box.put(KEY_LAST_LNG, lastLng);
  }

  num get devicePixelRatio {
    return box.get(KEY_DEVICE_PIXEL_RATIO) ?? 0.0;
  }

  set devicePixelRatio(num devicePixelRatio) {
    box.put(KEY_DEVICE_PIXEL_RATIO, devicePixelRatio);
  }

  String get defaultCard {
    return box.get(KEY_DEFAULT_CARD_ID) ?? "";
  }

  set defaultCard(String defaultCardId) {
    box.put(KEY_DEFAULT_CARD_ID, defaultCardId);
  }

  void saveLocalPref({
    paramParentId,
    paramIsLogin,
  }) {
    box.put(KEY_IS_LOGIN, paramIsLogin);
    //box.put(KEY_USER_ID, paramUserId);
    box.put(KEY_PARENT_ID, paramParentId);
  }

  // On logout clear prefrence
  void clearPrefrence() async {
    await box.clear();
  }
}
