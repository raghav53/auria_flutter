import 'package:auria_ai/screens/SignUp/SignUpModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/Login/LoginScreen.dart';
import '../screens/Welcome/WelcomeScreen.dart';
import '../utils/all_keys.dart';

String key_splite = "_*_";
String baseUrl = 'http://3.227.175.32:5544/apis/';
String password = 'QXVyaWEgQXBwIENyZWF0ZWQgQnkgQ2hhbmRhbg';

SignUpModel signUpModel = SignUpModel();

var token = "qwe";

//---------------------------------Post Method----------------------------------

Future<String> postMethod(
    String method,
    String url,
    Map<String, String>? fieldsParams,
    Map<String, String>? imageParams,
    BuildContext context) async {
  Map<String, String> headers = <String, String>{
    "Accept": "application/json",
    "security_key": password,
  };
  print("headers_____$headers");

  var request = http.MultipartRequest(method, Uri.parse("$baseUrl/$url"));

  if (fieldsParams != null) {
    request.fields.addAll(fieldsParams);
  }
  if (imageParams != null) {
    imageParams.forEach((key, value) async {
      request.files.add(
          await http.MultipartFile.fromPath(key.split(key_splite)[0], value));
    });
  }

  request.headers.addAll(headers);
  http.StreamedResponse streamedRequest = await request.send();
  print(streamedRequest.toString());
  return await streamedRequest.stream.bytesToString();
}

Future<String> methodWithHeader(
    String method,
    String url,
    Map<String, String>? fieldsParams,
    Map<String, String>? imageParams,
    BuildContext context) async {
  SharedPreferences srf = await SharedPreferences.getInstance();


  Map<String, String> headers = <String, String>{
    "Accept": "application/json",
    "security_key": password,
    'authorization': '${srf.getString(AllKeys.auth)}',
  };
  print("headers_____$headers");
  var request = http.MultipartRequest(method, Uri.parse("$baseUrl/$url"));
  if (fieldsParams != null) {
    request.fields.addAll(fieldsParams);
  }
  if (imageParams != null) {
    imageParams.forEach((key, value) async {
      request.files.add(
          await http.MultipartFile.fromPath(key.split(key_splite)[0], value));
    });
  }

  request.headers.addAll(headers);
  http.StreamedResponse streamedRequest = await request.send();
  print(streamedRequest.toString());
  if (streamedRequest.statusCode == 401) {
    srf.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => WelcomeScreen(),
      ),
      (route) => false,
    );
  }

  return await streamedRequest.stream.bytesToString();
}

//---------------------------------Get Method-----------------------------------

Future<String> getMethodWithQuery(String method, String endUrl,
    Map<String, String>? params, BuildContext context) async {
  SharedPreferences srf = await SharedPreferences.getInstance();
  Map<String, String> headers = <String, String>{
    "Accept": "application/json",
    "security_key": password,
    'authorization': '${srf.getString(AllKeys.auth)}',
  };
  print("headers_____$headers");

  var request = http.Request(method, Uri.parse('$baseUrl/$endUrl'));

  if (params != null) {
    request.bodyFields.addAll(params);
  }

  request.headers.addAll(headers);
  http.StreamedResponse streamedResponse = await request.send();
  print(streamedResponse.toString());

  if (streamedResponse.statusCode == 401) {
    srf.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => WelcomeScreen(),
      ),
      (route) => false,
    );
  }

  return await streamedResponse.stream.bytesToString();
}
