import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/app_config.dart';
import '../../../../models/user/user_data.dart';

class UserManager {
  Dio dio = Dio();

  Future login({required String email, required String password}) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({
      "email_id": email,
      "password": password,
    });

    ///hh
    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/users/login/',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      return UserData.fromJson(jsonDecode(response.data));
    } else {
      return null;
    }
  }

  Future<List<UserData>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/users/list/',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      var data = jsonDecode(response.data);
      List<Map> list = data;
      for (var a in list) {}
      return [];
    } else {
      return [];
      print(response.statusMessage);
    }
  }

  Future<String?> createUser(
      {required String uid,
      emailId,
      employeeId,
      userName,
      role,
      password,
      confirmPassword}) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = json.encode({
      "user_uid": uid,
      "email_id": emailId,
      "employee_id": employeeId,
      "user_name": userName,
      "role": role,
      "password": password,
      "confirm_password": confirmPassword,
    });
    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/users/register/',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      return response.statusMessage;
    } else {
      return response.statusMessage;
    }
  }
}
