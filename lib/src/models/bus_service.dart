class BusService {
  String serviceNumber;
  int operator;
  int direction;
  int category;
  String originCode;
  String destinationCode;
  String amPeakFrequency;
  String amOffpeakFrequency;
  String pmPeakFrequency;
  String pmOffpeakFrequency;
  String loopDescription;

  BusService(
      this.serviceNumber,
      this.operator,
      this.direction,
      this.category,
      this.originCode,
      this.destinationCode,
      this.amPeakFrequency,
      this.amOffpeakFrequency,
      this.pmPeakFrequency,
      this.pmOffpeakFrequency,
      this.loopDescription);

//  {
//  "ServiceNo": "118",
//  "Operator": "GAS",
//  "Direction": 1,
//  "Category": "TRUNK",
//  "OriginCode": "65009",
//  "DestinationCode": "97009",
//  "AM_Peak_Freq": "06-08",
//  "AM_Offpeak_Freq": "08-15",
//  "PM_Peak_Freq": "10-12",
//  "PM_Offpeak_Freq": "11-15",
//  "LoopDesc": ""
//  },

}
