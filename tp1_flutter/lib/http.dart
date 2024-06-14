import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';

import 'DTOs/transfer.dart';
import 'main.dart';

class SingletonDIO{


  static var cookiemanager = CookieManager(CookieJar());



  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookiemanager);
    return dio;
  }

  static String pseudoSingleton = "";


}


String baseUrl = "http://10.0.2.2:8080/";

Future<SigninResponse> Register(SignupRequest signupReq) async {
  try{
    var response = await SingletonDIO.getDio().post(baseUrl+"api/id/signup", data: signupReq.toJson());
    print(response);
    SingletonDIO.pseudoSingleton = signupReq.username;
    return SigninResponse.fromJson(response.data);
  }
  catch(e){
    print(e);
    throw(e);
  }

}

Future<SigninResponse> Login(SigninRequest signinReq) async {
  try{
    var response = await SingletonDIO.getDio().post(baseUrl+"api/id/signin", data: signinReq.toJson());
    print(response);
    SingletonDIO.pseudoSingleton = signinReq.username;
    return SigninResponse.fromJson(response.data);
  }
  catch(e){
    print(e);
    throw(e);
  }
}

Future<String> Logout() async{
  try{
    var response = await SingletonDIO.getDio().post(baseUrl+"api/id/signout");
    print(response);
    SingletonDIO.pseudoSingleton = "";
    return response.toString();
  }
  catch(e){
    print(e);
    throw(e);
  }
}

Future<List<HomeItemResponse>> GetAllTasks() async {
  try{
    var response = await SingletonDIO.getDio().get(baseUrl+"api/home");
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

CreateTask(AddTaskRequest addtaskReq) async {
  try{
    var response = await SingletonDIO.getDio().post(baseUrl+"api/add", data: addtaskReq.toJson());
    print(response);
  }
  catch(e){
    print(e);
    throw(e);
  }
}

Future<TaskDetailResponse> SeeTask(int taskID) async {
  try{
    var response = await SingletonDIO.getDio().get(baseUrl+"api/detail/$taskID");
    print(response);
    return TaskDetailResponse.fromJson(response.data);
  }
  catch(e){
    print(e);
    throw(e);
  }
}

ChangeProgress(int taskID, int value) async {
  try{
    var response = await SingletonDIO.getDio().get(baseUrl+"api/progress/$taskID/$value");
    print(response);
  }
  catch(e){
    print(e);
    throw(e);
  }
}