import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rickmorty/core/app_error.dart';
import 'package:rickmorty/features/data/models/character_model.dart';
import 'package:rickmorty/features/domain/repositories/base_repo.dart';

class ImplCharRepo implements BaseCharRepo {
  final Dio dio;
  ImplCharRepo({required this.dio});

  @override
  Future<BaseCharRepoResponse> getAllCharacters(
      {String? text, int? currentPage, String? status, String? gender}) async {
    try {
      final result = await dio.get('character', queryParameters: {
        'name': text,
        'page': currentPage,
        'status': status,
        'gender': gender,
      });
      return BaseCharRepoResponse(
          chars: CharacterInfoModel.fromJson(result.data));
    } on DioError catch (e) {
      return BaseCharRepoResponse(
        error: AppError(
            statusCode: e.response?.statusCode,
            text: e.message,
            error: e.response?.data.toString()),
      );
    }
  }
}
