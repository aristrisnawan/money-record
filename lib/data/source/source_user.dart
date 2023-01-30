import 'package:d_info/d_info.dart';
import 'package:d_method/d_method.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_record/config/api.dart';
import 'package:money_record/config/app_request.dart';
import 'package:money_record/config/session.dart';
import 'package:money_record/data/model/user.dart';

class sourceUser {

  static Future<bool> login(String email, String password) async {
    String url = Api.user + '/login.php';
    Map? responseBody =
        await AppRequest.post(url, {'email': email, 'password': password});
    if (responseBody == null) return false;

    if (responseBody['success']) {
      var mapUser = responseBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }

    return responseBody['success'];
  }

  static Future<bool> register(
      String name, String email, String password) async {
    String url = Api.user + '/register.php';
    Map? responseBody = await AppRequest.post(url, {
      'name': name,
      'email': email,
      'password': password,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String()
    });
    if (responseBody == null) return false;

    if (responseBody['success']) {
      DMethod.printTitle('title', 'berhasil register');
    } else {
      if (responseBody['message'] == 'email') {
        DMethod.printTitle('message', 'email sudah terdaftar');
      } else {
        DMethod.printTitle('message', 'gagal register');
      }
    }

    return responseBody['success'];
  }
}
