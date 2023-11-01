import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/app_config.dart';
import '../../../../models/confirmation/operator/operator_data.dart';

class OperatorConfirmationManager {
  Dio dio = Dio();
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjo0ODUyNDE3ODEyLCJpYXQiOjE2OTg4MTc4MTIsImp0aSI6IjAyMTA1MDEzYTg1ZDRlZjJiYWY0YWJiYjI5MzRiMTVmIiwidXNlcl9pZCI6MX0.ve3expi73Mkg1ZYJ7Fwc5SnBF-s3NBps-S8pgYlOLoo';

  /// Get Operator Data List #GET
  Future<List<OperatorData>> getOperatorDataList() async {
    final prefs = await SharedPreferences.getInstance();
    //String? token = prefs.getString('access');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/oprconf/list/',
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

  /// Create Operator Conf Data #POST
  Future createOperatorData(
      {required int id,
      required String aufnr,
      posnr,
      auart,
      autyp,
      erdat,
      werks,
      lgort,
      matnr,
      vornr,
      ltxa1,
      yiel,
      rwqty,
      rjqty,
      act01,
      act02,
      act03,
      act04,
      act05,
      act06,
      dtc01,
      dwt01,
      dtc02,
      dwt02,
      dtc03,
      dwt03,
      dtc04,
      dwt04,
      dtc05,
      dwt05,
      dtc06,
      dwt06,
      cflag}) async {
    final prefs = await SharedPreferences.getInstance();
    //String? token = prefs.getString('access');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = json.encode({
      'id': id,
      'aufnr': aufnr,
      'posnr': posnr,
      'auart': auart,
      'autyp': autyp,
      'erdat': erdat,
      'werks': werks,
      'lgort': lgort,
      'matnr': matnr,
      'vornr': vornr,
      'ltxa1': ltxa1,
      'yield': yiel,
      'rwqty': rwqty,
      'rjqty': rjqty,
      'act01': act01,
      'act02': act02,
      'act03': act03,
      'act04': act04,
      'act05': act05,
      'act06': act06,
      'dtc01': dtc01,
      'dwt01': dwt01,
      'dtc02': dtc02,
      'dwt02': dwt02,
      'dtc03': dtc03,
      'dwt03': dwt03,
      'dtc04': dtc04,
      'dwt04': dwt04,
      'dtc05': dtc05,
      'dwt05': dwt05,
      'dtc06': dtc06,
      "dwt06": dwt06,
      "cflag": cflag
    });
    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/oprconf/create/',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  /// Delete Operator Data #DELETE
  Future deleteOperatorData({required int id}) async {
    final prefs = await SharedPreferences.getInstance();
    //String? token = prefs.getString('access');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/oprconf/delete/$id/',
      options: Options(
        method: 'DELETE',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  /// Get Operator Detail Data #GET
  Future getOperatorData({required int id}) async {
    final prefs = await SharedPreferences.getInstance();
    //String? token = prefs.getString('access');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/oprconf/detail/$id/',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  /// Update Operator Conf #PATCH/UPDATE

  Future updateOperatorData({required String autyp, required int id}) async {
    final prefs = await SharedPreferences.getInstance();
    //String? token = prefs.getString('access');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = json.encode({"autyp": autyp});
    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/oprconf/update/$id/',
      options: Options(
        method: 'PATCH',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  /// Bulk Create Operator  Conf #POST
  Future bulkCreateOperatorData({required List<OperatorData> list}) async {
    final prefs = await SharedPreferences.getInstance();
    //String? token = prefs.getString('access');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    List dataNew = [];
    for (var p in list) {
      dataNew.add(p.toJson());
    }
    var data = json.encode([dataNew]);
    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/oprconf/bulk-create/',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  /// Bulk Delete Operator Conf # POST
  Future bulkDeleteOperatorData({required List<OperatorData> list}) async {
    final prefs = await SharedPreferences.getInstance();
    //String? token = prefs.getString('access');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    List dataNew = [];
    for (var p in list) {
      dataNew.add(p.id);
    }
    var data = json.encode({
      "sctids": dataNew,
    });
    var dio = Dio();
    var response = await dio.request(
      '${AppConfig.endpoint}/api/v1/oprconf/bulk-delete/',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
