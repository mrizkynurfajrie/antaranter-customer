import 'package:get_storage/get_storage.dart';

const String CACHE_USERNAME = "username";
const String CACHE_TOKEN = "token";
const String CHECK_LOGIN = "loginState";
const String CACHE_USER = "user";

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
}

