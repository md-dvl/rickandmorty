import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickmorty/features/data/models/user_model.dart';
import 'package:rickmorty/features/domain/usecases/character_usecase.dart';
import 'package:rickmorty/features/domain/usecases/user_usecase.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserCase usecase;
  UserBloc({
    required this.usecase,
  }) : super(const UserState.initial()) {
    on<_getModel>(((event, emit) async {
      final userModel = usecase.getModel();
      emit(UserState.successGet(user: userModel));
    }));

    on<_saveData>(((event, emit) async {
      usecase.saveData(
        name: event.name,
        surname: event.surname,
        patronymic: event.patronymic,
        avatar: event.avatar,
      );
    }));
  }
}

@freezed
class UserState with _$UserState {
  const factory UserState.successGet({
    required UserModel user,
  }) = _SuccessGet;
  const factory UserState.successSave() = _SuccessSave;
  const factory UserState.initial() = _Initial;
}

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getModel() = _getModel;
  const factory UserEvent.saveData({
    String? name,
    String? surname,
    String? avatar,
    String? patronymic,
  }) = _saveData;
}
