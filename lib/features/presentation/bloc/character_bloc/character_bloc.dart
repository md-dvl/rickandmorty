import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickmorty/features/data/models/character_model.dart';
import 'package:rickmorty/features/domain/usecases/character_usecase.dart';
part 'character_bloc.freezed.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterCase usecase;

  late int maxPages;
  CharacterBloc({
    required this.usecase,
  }) : super(const CharacterState.initial()) {
    on<_getAllCharacters>(((event, emit) async {
      // emit(const CharacterState.loading());
      final result = await usecase.getAllCharacters(
        currentPage: event.currentPage,
        text: event.text,
        status: event.status,
        gender: event.gender,
      );
      maxPages = result.chars?.info?.pages ?? 1;
      final chars = result.chars?.results ?? [];
      emit(CharacterState.success(chars: chars, maxPages: maxPages));
    }));

    on<_setFilters>(((event, emit) {
      usecase.setFilters(
        status: event.status,
        gender: event.gender,
      );
    }));
  }
}

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.success({
    required List<CharacterModel> chars,
    required int maxPages,
  }) = _Success;
  const factory CharacterState.loading() = _Loading;
  const factory CharacterState.error() = _Error;
  const factory CharacterState.initial() = _Initial;
}

@freezed
class CharacterEvent with _$CharacterEvent {
  const factory CharacterEvent.getAllCharacters({
    String? text,
    int? currentPage,
    String? status,
    String? gender,
  }) = _getAllCharacters;

  const factory CharacterEvent.setFilters({
    String? status,
    String? gender,
  }) = _setFilters;
}
