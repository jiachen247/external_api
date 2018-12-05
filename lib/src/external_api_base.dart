import 'package:external_api/src/api/api.dart';
import 'package:external_api/src/models/bus_route.dart';
import 'package:external_api/src/models/bus_service.dart';
import 'package:external_api/src/models/bus_stop.dart';
import 'package:external_api/src/models/bus_stop_timings.dart';
import 'package:external_api/src/models/bus_timings.dart';

abstract class ExternalApiInterface {
  Future<BusStopTimings> getBusStopTimings(int busStopCode);

  Future<BusServiceTimings> getBusServiceTimings(
      int busStopCode, String ServiceNumber);

  Future<BusRoute> getBusRoutes([skip = 0]);

  Future<List<BusService>> getBusServices([skip = 0]);

  Future<List<BusStop>> getBusStops([skip = 0]);
}

class ExternalApi extends ExternalApiInterface {
  final String _API_KEY;
  Api _api;

  ExternalApi(this._API_KEY) {
    _api = Api(_API_KEY);
  }

  @override
  Future<BusRoute> getBusRoutes([skip = 0]) {
    // TODO: implement getBusRoutes
    return _api.getBusRoutes(skip);
  }

  @override
  Future<BusServiceTimings> getBusServiceTimings(
      int busStopCode, String serviceNumber) {
    // TODO: implement getBusServiceTimings
    return _api.getBusServiceTimings(busStopCode, serviceNumber);
  }

  @override
  Future<List<BusService>> getBusServices([skip = 0]) {
    // TODO: implement getBusServices
    return _api.getBusServices(skip);
  }

  @override
  Future<BusStopTimings> getBusStopTimings(int busStopCode) {
    // TODO: implement getBusStopTimings
    return _api.getBusStopTimings(busStopCode);
  }

  @override
  Future<List<BusStop>> getBusStops([skip = 0]) {
    // TODO: implement getBusStops
    return _api.getBusStops(skip);
  }
}
