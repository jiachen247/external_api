import 'package:external_api/src/models/bus_timing.dart';

class BusServiceTimings {
  String serviceNumber;
  int operator;
  List<BusTiming> busTimings;

  BusServiceTimings(this.serviceNumber, this.operator, this.busTimings);

  @override
  String toString() {
    return 'BusServiceTimings{serviceNumber: $serviceNumber, operator: $operator, busTimings: $busTimings}';
  }
}
