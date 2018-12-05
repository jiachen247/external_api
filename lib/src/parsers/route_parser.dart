import 'package:external_api/src/models/bus_route_stop.dart';
import 'package:external_api/src/parsers/fields/operator.dart';

class RouteParser {
  static BusRouteStop parse(Map json) {
    return BusRouteStop(
        json["ServiceNo"],
        Operator.parse(json["operator"]),
        json["Direction"],
        json["StopSequence"],
        json["BusStopCode"],
        json["Distance"],
        json["WD_FirstBus"],
        json["WD_LastBus"],
        json["SAT_FirstBus"],
        json["SAT_LastBus"],
        json["SUN_FirstBus"],
        json["SUN_LastBus"]);
  }
}
