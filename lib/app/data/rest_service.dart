import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'exceptions.dart';

class RestApiService {
  //get..........................................................
  Future<T> get<T>(Uri geturl, [String? t]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');
    T responseJson;
    print(geturl);
    try {
      final response = await http.get(geturl, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response);
      responseJson = _returnResponse(response);
    } on RestException catch (e) {
      throw e;
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  //Exception....
  dynamic _returnResponse<T>(T response) {
    print('respose-------------- $T');
    if (response is http.Response) {
      print(response.body);
      print('statusCode------------- ${response.statusCode}');
      switch (response.statusCode) {
        case 200:
          print(response.body);
          var responseJson = json.decode(response.body);
          print("responseJson : $responseJson");

          return responseJson;
        case 404:
          //throw  FetchDataErrorException(json.decode(response.body));
          return json.decode(response.body);
        case 400:
          throw BadRequestException(json.decode(response.body));
        case 401:
          var responseJson = json.decode(response.body);
          print("responseJson : $responseJson");

          return responseJson;
        case 403:
          throw UnauthorisedException(json.decode(response.body));
        case 500:
          /* default:
        GlobalWidgets().showToast(msg: CoupledStrings.serverDown);*/
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } else if (response is Map<String, dynamic>) {
      print("MAP :::");
      print(response);
      switch (response["code"]) {
        case 200:
          var responseJson = response;
          print("responseJson : $responseJson");
          return responseJson;
        case 404:
        case 400:
          throw BadRequestException(response["response"]);
        case 401:
        case 403:
          throw UnauthorisedException(response["response"]);
        case 500:
        default:
          // GlobalWidget().showToast(msg: StudentLinkStrings.serverDown);
          Get.dialog(Text('Server Down'));
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response["code"]}');
      }
    }
  }
}

class Apis {
  static String baseUrl = "https://www.butomy.com/api/";
  static String productlisturl = "getbusinessbytimeline-petpooja-timing";
}
