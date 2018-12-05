import 'package:external_api/external_api.dart';
import 'secret.dart';

main() async {
  ExternalApi api = ExternalApi(LTA_DATAMALL_API_KEY);
  api.getBusStopTimings(78059).then((BusStopTimings t) => print(t));
}
