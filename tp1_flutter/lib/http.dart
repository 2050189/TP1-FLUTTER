import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';

import 'DTOs/transfer.dart';
import 'main.dart';

class HttpHelper{
  String baseUrl = "http://10.0.2.2:8080/";

  static var cookiemanager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookiemanager);
    return dio;
  }

  Future<SigninResponse> Register(SignupRequest signupReq, BuildContext context, StatefulWidget page) async {
    try{
      var response = await getDio().post(baseUrl+"api/id/signup", data: signupReq.toJson());
      print(response);
      return SigninResponse.fromJson(response.data);
    }
    catch(e){
      print(e);
      throw(e);
    }

  }

  Future<SigninResponse> Login(SigninRequest signinReq, BuildContext context, StatefulWidget page) async {
    try{
      var response = await getDio().get(baseUrl+"api/id/signin", data: signinReq.toJson());
      print(response);
      return SigninResponse.fromJson(response.data);
    }
    catch(e){
      print(e);
      throw(e);
    }
  }

  Future<List<HomeItemResponse>> GetAllTasks(BuildContext context, StatefulWidget page) async {
    try{
      var response = await getDio().get(baseUrl+"api/home");
      print(response);
      var listeJSON = response.data as List;
      var listeTasks = listeJSON.map((elementJSON) {
        return HomeItemResponse.fromJson(elementJSON);
      }).toList();
      return listeTasks;
    }
    catch(e){
      print(e);
      throw(e);
    }
  }

  void CreateTask(AddTaskRequest addtaskReq, BuildContext context, StatefulWidget page) async {
    try{
      var response = await getDio().post(baseUrl+"api/add", data: addtaskReq.toJson());
      print(response);
    }
    catch(e){
      print(e);
      throw(e);
    }
  }

  Future<TaskDetailResponse> SeeTask(int taskID, BuildContext context, StatefulWidget page) async {
    try{
      var response = await getDio().get(baseUrl+"api/detail/{$taskID}");
      print(response);
      return TaskDetailResponse.fromJson(response.data);
    }
    catch(e){
      print(e);
      throw(e);
    }
  }

  ChangeProgress(int taskID, int value, BuildContext context, StatefulWidget page) async {
    try{
      var response = await getDio().get(baseUrl+"api/progress/{$taskID}/{$value}");
      print(response);
    }
    catch(e){
      print(e);
      throw(e);
    }
  }


}
