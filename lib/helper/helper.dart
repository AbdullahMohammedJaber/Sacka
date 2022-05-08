import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setDataApp({
    @required bool a,
  }) async {
    await sharedPreferences.setBool('aa', a);
  }

  static Future<bool> setApp({
    @required bool a,
  }) async {
    await sharedPreferences.setBool('bb', a);
  }

  static bool getDataApp({
    @required String key,
  }) {
    return sharedPreferences.getBool(key);
  }

  static Future<bool> removeData({@required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
