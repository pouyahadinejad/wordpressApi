import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:plantapp/constans/constans.dart';
import 'package:plantapp/models/woocommercr/login_model.dart';
import 'package:plantapp/models/woocommercr/product_model.dart';
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

  Future<LoginResponseModel> loginCustomer(
    String username,
    String password,
  ) async {
    late LoginResponseModel loginModel;
    try {
      var response = await Dio().post(
        WoocomerceInfo.tokenUrl,
        data: {
          'username': username,
          'password': password,
        },
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );
      if (response.statusCode == 200) {
        loginModel = LoginResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      throw 'Error $e';
    }
    return loginModel;
  }

  Future<List<Product>> getProducts() async {
    final String productURL =
        "${WoocomerceInfo.baseURL}${WoocomerceInfo.productURL}?consumer_key=${WoocomerceInfo.consumerKey}&consumer_secret=${WoocomerceInfo.consumerSecret}";
    List<Product> productList = <Product>[];
    try {
      Response response = await Dio().get(
        productURL,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );
      if (response.statusCode == 200) {
        productList = (response.data as List)
            .map(
              (i) => Product.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      throw 'Error $e';
    }
    return productList;
  }
}
