import 'package:external_api/src/models/bus_timings.dart';

class BusStopTimings {
  String busStopCode;
  List<BusServiceTimings> busServiceTimings;

  BusStopTimings(this.busStopCode, this.busServiceTimings);

  @override
  String toString() {
    return 'BusStopTimings{busStopCode: $busStopCode, busServiceTimings: $busServiceTimings}';
  }
}
