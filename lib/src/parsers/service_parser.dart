import 'package:external_api/src/models/bus_service.dart';
import 'package:external_api/src/parsers/fields/category.dart';
import 'package:external_api/src/parsers/fields/operator.dart';

class ServiceParser {
  static BusService parse(Map json) {
    return BusService(
        json["ServiceNo"],
        Operator.parse(json["Operator"]),
        json["Direction"],
        Category.parse(json["Category"]),
        json["OriginCode"],
        json["DestinationCode"],
        json["AM_Peak_Freq"],
        json["AM_Offpeak_Freq"],
        json["PM_Peak_Freq"],
        json["PM_Offpeak_Freq"],
        json["LoopDesc"]);
  }
}
