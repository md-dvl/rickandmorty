import 'package:rickmorty/core/app_error.dart';
import 'package:rickmorty/features/data/models/character_model.dart';

abstract class BaseCharRepo {
  Future<BaseCharRepoResponse> getAllCharacters({
    String? text,
    int? currentPage,
  });

  Future<BaseCharRepoResponse> getFilteredCharacters({
    String? status,
  });
}

class BaseCharRepoResponse {
  BaseCharRepoResponse({
    this.error,
    this.chars,
  });
  final AppError? error;
  final CharacterInfoModel? chars;
}
