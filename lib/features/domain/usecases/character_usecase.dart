import 'package:rickmorty/features/domain/repositories/base_repo.dart';

class CharacterCase {
  final BaseCharRepo charRepo;

  CharacterCase({
    required this.charRepo,
  });

  String status = '';
  String gender = '';

  Future<BaseCharRepoResponse> getAllCharacters({
    String? text,
    int? currentPage,
    String? status,
    String? gender,
  }) async {
    return await charRepo.getAllCharacters(
      text: text,
      currentPage: currentPage,
      status: this.status,
      gender: this.gender,
    );
  }

  void setFilters({
    String? status,
    String? gender,
  }) {
    this.status = status ?? '';
    this.gender = gender ?? '';
  }
}
