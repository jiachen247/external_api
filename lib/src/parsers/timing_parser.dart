import 'package:external_api/external_api.dart';
import 'package:external_api/src/parsers/fields/load.dart';
import 'package:external_api/src/parsers/fields/operator.dart';
import 'package:external_api/src/parsers/fields/wheelchair_feature.dart';
import 'package:external_api/src/util.dart' as Util;
import 'package:external_api/src/parsers/fields/types.dart';

class TimingParser {
  static BusServiceTimings toBusServiceTimings(Map json) {
    return parseServiceTimings(json["Services"][0]);
  }

  static BusStopTimings toBusStopTimings(Map json) {
    return parseStopTimings(json);
  }

  static BusTiming parseBusTiming(Map json) {
    // EstimatedArrival may be empty
    if (json["EstimatedArrival"] == "" || json["EstimatedArrival"] == null) {
      return null;
    }

    return new BusTiming(
        json["OriginCode"],
        json["DestinationCode"],
        Util.getEtaInMinutes(json["EstimatedArrival"]),
        json["Latitude"],
        json["Longtitude"],
        int.parse(json["VisitNumber"]),
        Type.parse(json["Type"]),
        Load.parse(json["Load"]),
        WheelchairFeature.parse(json["Feature"]));
  }

  static BusServiceTimings parseServiceTimings(Map json) {
    List<BusTiming> busTimings = [];

    busTimings.add(parseBusTiming(json["NextBus"]));
    busTimings.add(parseBusTiming(json["NextBus2"]));
    busTimings.add(parseBusTiming(json["NextBus3"]));

    busTimings.removeWhere((value) => value == null);

    return new BusServiceTimings(
        json["ServiceNo"], Operator.parse(json["Operator"]), busTimings);
  }

  static BusStopTimings parseStopTimings(Map json) {
    List<BusServiceTimings> busServiceTimings = [];
    List servicesAvailable = json["Services"];

    servicesAvailable.forEach(
        (service) => busServiceTimings.add(parseServiceTimings(service)));

    return new BusStopTimings(json["BusStopCode"], busServiceTimings);
  }
}
