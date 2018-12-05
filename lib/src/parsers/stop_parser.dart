import 'package:external_api/src/models/bus_stop.dart';

class StopParser {
  static BusStop parse(Map json) {
    return BusStop(json["BusStopCode"], json["RoadName"], json["Description"],
        json["Latitude"], json["Longitude"]);
  }
}
