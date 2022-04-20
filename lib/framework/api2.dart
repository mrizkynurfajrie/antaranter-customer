import 'package:get_storage/get_storage.dart';

const String CACHE_USERNAME = "username";
const String CACHE_TOKEN = "token";
const String CHECK_LOGIN = "loginState";
const String CACHE_USER = "user";
const String CACHE_LATITUDE = "latitude";
const String CACHE_LONGITUDE = "longitude";
const String STATUS_ACTIVE_ORDER = "status_active_order";
const String CACHE_ACTIVE_ORDER = "order";
const String CHECK_AGREEMENT_NEBENG = "agreement_nebeng";
const String CACHE_API_LOGGER = "api_logger";

class Api2 {
  final box = GetStorage();

  Future setUsername({String? username}) async {
    username ??= "";
    await box.write(CACHE_USERNAME, username);
  }
  Future<String?> getUsername() async {
    return box.read(CACHE_USERNAME);
  }

  Future setUser({dynamic user}) async {
    user ??= "";
    await box.write(CACHE_USER, user);
  }
  Future<dynamic> getUser() async {
    return box.read(CACHE_USER);
  }

  Future setToken({String? token}) async {
    token ??= "";
    await box.write(CACHE_TOKEN, token);
  }
  Future<String?> getToken() async {
    return box.read(CACHE_TOKEN);
  }

  Future setIsLogin({bool? isLogin}) async{
    isLogin ??= false;
    await box.write(CHECK_LOGIN, isLogin);
  }
  Future<bool?> getLoginStatus()async{
    return box.read(CHECK_LOGIN);
  }

  Future setHasActiveOrder({bool? isHasActiveOrder}) async{
    isHasActiveOrder ??= false;
    await box.write(STATUS_ACTIVE_ORDER, isHasActiveOrder);
  }
  Future<bool?> getHasActiveOrder()async{
    return box.read(STATUS_ACTIVE_ORDER);
  }

  Future setActiveOrder({dynamic activeOrder}) async{
    activeOrder ??= "";
    await box.write(CACHE_ACTIVE_ORDER, activeOrder);
  }
  Future<dynamic> getActiveOrder()async{
    return box.read(CACHE_ACTIVE_ORDER);
  }
  Future<dynamic> removeActiveOrder()async{
    return box.remove(CACHE_ACTIVE_ORDER);
  }

  Future removeStorageForLogout() async{
    await box.remove(CACHE_USER);
    await box.remove(CACHE_TOKEN);
    await box.remove(CHECK_LOGIN);
    await box.remove(STATUS_ACTIVE_ORDER);
    await box.remove(CACHE_ACTIVE_ORDER);
    await box.remove(CHECK_AGREEMENT_NEBENG);
  }

  Future setAgreementNebeng({bool? status}) async{
    status ??= false;
    await box.write(CHECK_AGREEMENT_NEBENG, status);
  }
  Future<bool?> getAgreementNebeng()async{
    return box.read(CHECK_AGREEMENT_NEBENG);
  }

  Future setApiLogger({dynamic value}) async{
    value ??= "";
    await box.write(CACHE_API_LOGGER, value);
  }
  Future<dynamic> getApiLogger()async{
    return box.read(CACHE_API_LOGGER);
  }

}

