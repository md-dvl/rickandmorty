import 'package:flutter/cupertino.dart';

class UserModel {
  final String name;
  final String surname;
  final String? patronymic;
  final ImageProvider avatar;
  final String login;
  UserModel({
    required this.name,
    required this.surname,
    this.patronymic,
    required this.avatar,
    required this.login,
  });
}
