import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rickmorty/core/app_error.dart';
import 'package:rickmorty/features/data/models/character_model.dart';
import 'package:rickmorty/features/domain/repositories/base_repo.dart';
import 'package:rickmorty/features/presentation/bloc/character_bloc.dart';

class ImplCharRepo implements BaseCharRepo {
  final Dio dio;
  ImplCharRepo({required this.dio});

  @override
  Future<BaseCharRepoResponse> getAllCharacters(
      {String? text, int? currentPage}) async {
    try {
      final result = await dio.get('character',
          queryParameters: {'name': text, 'page': currentPage});
      return BaseCharRepoResponse(
          chars: CharacterInfoModel.fromJson(result.data));
    } on DioError catch (e) {
      return BaseCharRepoResponse(
        error: AppError(
          statusCode: e.response?.statusCode,
          text: e.message,
        ),
      );
    }
  }

  @override
  Future<BaseCharRepoResponse> getFilteredCharacters({String? status}) async {
    try {
      final result = await dio.get('character', queryParameters: {
        'status': status,
      });
      return BaseCharRepoResponse(
          chars: CharacterInfoModel.fromJson(result.data));
    } on DioError catch (e) {
      return BaseCharRepoResponse(
        error: AppError(
          statusCode: e.response?.statusCode,
          text: e.message,
        ),
      );
    }
  }
}
