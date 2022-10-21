import 'package:shared_preferences/shared_preferences.dart';

import 'package:rickmorty/features/domain/repositories/base_repo.dart';

class CharacterCase {
  final BaseCharRepo charRepo;

  CharacterCase({
    required this.charRepo,
  });

  String status = '';

  Future<BaseCharRepoResponse> getAllCharacters({
    String? text,
    int? currentPage,
  }) async {
    return await charRepo.getAllCharacters(
        text: text, currentPage: currentPage);
  }

  Future<BaseCharRepoResponse> getFilteredCharacters({
    String? status,
    int? currentPage,
  }) async {
    return await charRepo.getFilteredCharacters(
      status: status,
    );
  }

  void setFilters({
    String? status,
  }) {
    this.status = status ?? '';
  }

  String getFilters() {
    return status;
  }
}
