

import 'package:json_annotation/json_annotation.dart';

part 'transfer.g.dart';

@JsonSerializable()
class SignupRequest{
  String username;
  String password;

  SignupRequest({required this.username, required this.password});

}

@JsonSerializable()
class SigninRequest extends SignupRequest{
  SigninRequest({required super.username, required super.password});

}

@JsonSerializable()
class SigninResponse {
  String username;

  SigninResponse({required this.username});
}

@JsonSerializable()
class ProgressEvent{
  int value;
  DateTime timestamp;

  ProgressEvent({required this.value, required this.timestamp});
}

@JsonSerializable()
class HomeItemResponse{
   int id;
   String name;
   int percentageDone;
   double percentageTimeSpent;
   DateTime deadline;

   HomeItemResponse({required this.id, required this.name, required this.percentageDone, required this.percentageTimeSpent, required this.deadline});
}

@JsonSerializable()
class HomeItemPhotoResponse{
  int id;
  String name;
  int percentageDone;
  double percentageTimeSpent;
  DateTime deadline;
  int photoId;

  HomeItemPhotoResponse({required this.id, required this.name, required this.percentageDone, required this.percentageTimeSpent, required this.deadline, required this.photoId});
}

@JsonSerializable()
class AddTaskRequest{

  String name;
  DateTime deadline;

  AddTaskRequest({required this.name, required this.deadline});
}

@JsonSerializable()
class TaskDetailResponse{
  int id;
  String name;
  int percentageDone;
  double percentageTimeSpent;
  DateTime deadline;

  List<ProgressEvent> events;

  TaskDetailResponse({required this.id, required this.name, required this.percentageDone, required this.percentageTimeSpent, required this.deadline, required this.events});
}

@JsonSerializable()
class TaskDetailPhotoResponse{
  int id;
  String name;
  int percentageDone;
  double percentageTimeSpent;
  DateTime deadline;
  int photoId;
  List<ProgressEvent> events;

  TaskDetailPhotoResponse({required this.id, required this.name, required this.percentageDone, required this.percentageTimeSpent, required this.deadline, required this.photoId, required this.events});
}