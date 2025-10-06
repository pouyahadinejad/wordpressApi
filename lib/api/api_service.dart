import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:plantapp/constans/constans.dart';
import 'package:plantapp/models/woocommercr/register_model.dart';

class ApiService {
  Future<bool> createCustomer(CustomerModel model) async {
    bool returnResponse = false;
    String authToken = base64.encode(
      utf8.encode(
          "${WoocomerceInfo.consumerKey}:${WoocomerceInfo.consumerSecret}"),
    );
    try {
      var response =
          await Dio().post(WoocomerceInfo.baseURL + WoocomerceInfo.customerURL,
              data: model.toJson(),
              options: Options(headers: {
                HttpHeaders.authorizationHeader: 'Basic $authToken',
                HttpHeaders.contentTypeHeader: 'application/json',
              }));
      if (response.statusCode == 201) {
        returnResponse = true;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        returnResponse = false;
      } else {
        returnResponse = false;
      }
    }
    return returnResponse;
  }
}
