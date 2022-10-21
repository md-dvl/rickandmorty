import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickmorty/features/data/models/character_model.dart';
import 'package:rickmorty/features/domain/usecases/character_usecase.dart';
part 'character_bloc.freezed.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterCase usecase;
  CharacterBloc({
    required this.usecase,
  }) : super(const CharacterState.initial()) {
    on<_getAllCharacters>(((event, emit) async {
      emit(const CharacterState.loading());
      final result = await usecase.getAllCharacters();
      final chars = result.chars?.results ?? [];
      emit(CharacterState.success(chars: chars));
    }));

    on<_getSearchedCharacters>(((event, emit) async {
      final result = await usecase.getAllCharacters(text: event.text);
      final chars = result.chars?.results ?? [];
      if (chars.isEmpty) {
        emit(const CharacterState.error());
      }
      emit(CharacterState.success(chars: chars));
    }));

    on<_getFilteredCharacters>(((event, emit) async {
      final result = await usecase.getFilteredCharacters(status: event.status);
      final chars = result.chars?.results ?? [];
      emit(CharacterState.success(chars: chars));
    }));

    on<_setFilters>(((event, emit) {
      usecase.setFilters(status: event.status);
    }));

    on<_getFilters>(((event, emit) {
      usecase.getFilters();
    }));
  }
}

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.success({
    required List<CharacterModel> chars,
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
  }) = _getAllCharacters;
  const factory CharacterEvent.getSearchedCharacters({
    String? text,
  }) = _getSearchedCharacters;
  const factory CharacterEvent.getFilteredCharacters({
    String? status,
  }) = _getFilteredCharacters;
  const factory CharacterEvent.setFilters({
    String? status,
  }) = _setFilters;

  const factory CharacterEvent.getFilters() = _getFilters;
}
