import 'package:flutter/foundation.dart';
import 'package:intermeeting/app/di/injector.dart';
import 'package:intermeeting/core/view_state.dart';
import 'package:intermeeting/data/model/dto/character/character_dto.dart';
import 'package:intermeeting/data/remote/dio/data_state.dart';
import 'package:intermeeting/domain/character/get_character_detail.dart';

class CharacterDetailViewModel extends ChangeNotifier {
  final GetCharacterDetail _getCharacterDetail = injector<GetCharacterDetail>();
  ViewState<CharacterDto> viewState = ViewState(state: ResponseState.EMPTY);

  CharacterDto? dto;

  void _setViewState(ViewState<CharacterDto> viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  Future<void> loadCharacterDetail(int characterId) async {
    _setViewState(ViewState.loading());
    final detail = await _getCharacterDetail.call(
        params: GetCharacterDetailParams(characterId));
    if (detail is DataSuccess) {
      dto = detail.data;
      _setViewState(ViewState.complete(dto!));
    }
    if (detail is DataFailed) {
      if (kDebugMode) {
        print(detail.error);
      }
      _setViewState(ViewState.error(detail.error.toString()));
    }
  }
}
