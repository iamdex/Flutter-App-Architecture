import 'package:retrofit/retrofit.dart';
import 'package:intermeeting/data/model/remote/location/LocationInfo.dart';
import 'package:intermeeting/data/model/remote/location/LocationResponse.dart';
import 'package:intermeeting/data/remote/service/location/location_service.dart';

class LocationRepository {
  final LocationService _locationService;

  LocationRepository(this._locationService);

  Future<HttpResponse<LocationResponse>> getLocations(
    int page,
    Map<String, String>? options,
  ) => _locationService.getLocations(page, options);

  Future<HttpResponse<LocationInfo>> getLocation(int id) =>
      _locationService.getLocation(id);
}
