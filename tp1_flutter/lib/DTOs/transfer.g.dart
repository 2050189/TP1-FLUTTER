// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

SigninRequest _$SigninRequestFromJson(Map<String, dynamic> json) =>
    SigninRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SigninRequestToJson(SigninRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

SigninResponse _$SigninResponseFromJson(Map<String, dynamic> json) =>
    SigninResponse(
      username: json['username'] as String,
    );

Map<String, dynamic> _$SigninResponseToJson(SigninResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
    };

ProgressEvent _$ProgressEventFromJson(Map<String, dynamic> json) =>
    ProgressEvent(
      value: (json['value'] as num).toInt(),
      timestamp: (json['timestamp'] as num).toInt(),
    );

Map<String, dynamic> _$ProgressEventToJson(ProgressEvent instance) =>
    <String, dynamic>{
      'value': instance.value,
      'timestamp': instance.timestamp,
    };

HomeItemResponse _$HomeItemResponseFromJson(Map<String, dynamic> json) =>
    HomeItemResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      percentageDone: (json['percentageDone'] as num).toInt(),
      percentageTimeSpent: (json['percentageTimeSpent'] as num).toDouble(),
      deadline: (json['deadline'] as num).toInt(),
    );

Map<String, dynamic> _$HomeItemResponseToJson(HomeItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'deadline': instance.deadline,
    };

HomeItemPhotoResponse _$HomeItemPhotoResponseFromJson(
        Map<String, dynamic> json) =>
    HomeItemPhotoResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      percentageDone: (json['percentageDone'] as num).toInt(),
      percentageTimeSpent: (json['percentageTimeSpent'] as num).toDouble(),
      deadline: (json['deadline'] as num).toInt(),
      photoId: (json['photoId'] as num).toInt(),
    );

Map<String, dynamic> _$HomeItemPhotoResponseToJson(
        HomeItemPhotoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'deadline': instance.deadline,
      'photoId': instance.photoId,
    };

AddTaskRequest _$AddTaskRequestFromJson(Map<String, dynamic> json) =>
    AddTaskRequest(
      name: json['name'] as String,
      deadline: (json['deadline'] as num).toInt(),
    );

Map<String, dynamic> _$AddTaskRequestToJson(AddTaskRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deadline': instance.deadline,
    };

TaskDetailResponse _$TaskDetailResponseFromJson(Map<String, dynamic> json) =>
    TaskDetailResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      percentageDone: (json['percentageDone'] as num).toInt(),
      percentageTimeSpent: (json['percentageTimeSpent'] as num).toDouble(),
      deadline: (json['deadline'] as num).toInt(),
      events: (json['events'] as List<dynamic>)
          .map((e) => ProgressEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskDetailResponseToJson(TaskDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'deadline': instance.deadline,
      'events': instance.events,
    };

TaskDetailPhotoResponse _$TaskDetailPhotoResponseFromJson(
        Map<String, dynamic> json) =>
    TaskDetailPhotoResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      percentageDone: (json['percentageDone'] as num).toInt(),
      percentageTimeSpent: (json['percentageTimeSpent'] as num).toDouble(),
      deadline: (json['deadline'] as num).toInt(),
      photoId: (json['photoId'] as num).toInt(),
      events: (json['events'] as List<dynamic>)
          .map((e) => ProgressEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskDetailPhotoResponseToJson(
        TaskDetailPhotoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'deadline': instance.deadline,
      'photoId': instance.photoId,
      'events': instance.events,
    };
