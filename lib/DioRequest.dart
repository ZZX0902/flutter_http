import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert' as Convert;
//import 'package:http/http.dart' as http;

typedef requestCallBack = void Function(dynamic);

class HttpManager {
  post (String url,Map<String, dynamic> params,requestCallBack completeHandler,requestCallBack failHandler) async {
    try{
      var dio = new Dio();
      var response = await dio.post(url, data: params);
      final data = response.data["data"];
      completeHandler(data);
    }on DioError catch (e){
      print("=======");
      failHandler(e.message);
    }
  }
}