import 'dart:convert';

import 'package:get/get.dart';
import 'package:money_record/data/model/user.dart';
import 'package:money_record/presentation/controller/c_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  // function save user
  static Future<bool> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String StringUser = jsonEncode(mapUser);
    bool success = await pref.setString('user', StringUser);
    if (success) {
      final cUser = Get.put(CUser());
      cUser.setData(user);
    }
    return success;
  }

  //Get data user
  static Future<User> getUser() async {
    User user = User(); //default result
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');

    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    final cUser = Get.put(CUser());
    cUser.setData(user);
    return user;
  }

  //Delete session user
  static Future<bool> deleteUser() async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove('user');
    final cUser = Get.put(CUser());
    cUser.setData(User());
    return success;
  }
}


// Catatan :
// Kalau ambil berarti Get
// kalau simpan berarti Set