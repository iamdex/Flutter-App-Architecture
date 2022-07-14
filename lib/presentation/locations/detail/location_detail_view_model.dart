import 'package:flutter/foundation.dart';
import 'package:intermeeting/app/di/injector.dart';
import 'package:intermeeting/core/view_state.dart';
import 'package:intermeeting/data/model/dto/location/location_dto.dart';
import 'package:intermeeting/data/remote/dio/data_state.dart';
import 'package:intermeeting/domain/location/get_location_detail.dart';
import 'package:stacked/stacked.dart';

class LocationDetailViewModel extends BaseViewModel {
  final GetLocationDetail _getLocationDetail = injector<GetLocationDetail>();
  ViewState<LocationDto> viewState = ViewState(state: ResponseState.EMPTY);

  LocationDto? dto;

  void _setViewState(ViewState<LocationDto> viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  Future<void> loadDetail(int id) async {
    _setViewState(ViewState.loading());
    final detail =
        await _getLocationDetail.call(params: GetLocationDetailParams(id));
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
