import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rickmorty/features/data/models/user_model.dart';

class UserCase {
  final SharedPreferences prefs;
  UserCase({
    required this.prefs,
  });
  UserModel getModel() {
    final ImageProvider avatar = prefs.getString('avatar') == null
        ? const AssetImage(AppImages.mortyAvaSet2x)
        : (Image.memory(base64Decode(prefs.getString('avatar')!)).image);
    final String name = prefs.getString('name') ?? 'Oleg';
    final String surname = prefs.getString('surname') ?? 'Belotserkovsky';
    final String patronymic = prefs.getString('patronymic') ?? '';
    return UserModel(
      name: name,
      surname: surname,
      avatar: avatar,
      patronymic: patronymic,
    );
  }

  void saveData({
    String? name,
    String? surname,
    String? patronymic,
    String? avatar,
  }) {
    if (avatar != null) {
      prefs.setString('avatar', avatar);
    }
    if (name != null) {
      prefs.setString('name', name);
    }
    if (surname != null) {
      prefs.setString('surname', surname);
    }
    if (patronymic != null) {
      prefs.setString('patronymic', patronymic);
    }
  }
}
