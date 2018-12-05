class BusRouteStop {
  String serviceNumber;

  BusRouteStop(
      this.serviceNumber,
      this.operator,
      this.direction,
      this.stopSequence,
      this.busStopCode,
      this.distance,
      this.weekdayFirstBus,
      this.weekdayLastBus,
      this.satFirstBus,
      this.satLastBus,
      this.sunFirstBus,
      this.sunLastBus);

  int operator;
  int direction;
  int stopSequence;
  String busStopCode;
  num distance;

  String weekdayFirstBus;
  String weekdayLastBus;
  String satFirstBus;
  String satLastBus;
  String sunFirstBus;
  String sunLastBus;

//
//
//  {
//  "ServiceNo": "10",
//  "Operator": "SBST",
//  "Direction": 1,
//  "StopSequence": 1,
//  "BusStopCode": "75009",
//  "Distance": 0,
//  "WD_FirstBus": "0500",
//  "WD_LastBus": "2300",
//  "SAT_FirstBus": "0500",
//  "SAT_LastBus": "2300",
//  "SUN_FirstBus": "0500",
//  "SUN_LastBus": "2300"
//  },

}
