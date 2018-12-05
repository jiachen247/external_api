class BusTiming {
  String originCode;
  String destinationCode;
  int estimatedArrival;
  String latitude;
  String longtitude;
  int visitNumber;
  int type;
  int load;

  @override
  String toString() {
    return 'BusTiming{originCode: $originCode, destinationCode: $destinationCode, estimatedArrival: $estimatedArrival, latitude: $latitude, longtitude: $longtitude, visitNumber: $visitNumber, type: $type, load: $load, wheelChairFeature: $wheelChairFeature}';
  }

  bool wheelChairFeature;

  BusTiming(
      this.originCode,
      this.destinationCode,
      this.estimatedArrival,
      this.latitude,
      this.longtitude,
      this.visitNumber,
      this.type,
      this.load,
      this.wheelChairFeature);
}
