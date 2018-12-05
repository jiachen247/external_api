int getEtaInMinutes(String dateTimeString, [DateTime now = null]) {
  if (now == null) {
    now = new DateTime.now();
  }
  DateTime.parse(dateTimeString);
  return DateTime.parse(dateTimeString).difference(now).inMinutes;
}
