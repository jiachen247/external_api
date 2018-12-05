import 'dart:convert';
import 'dart:io';

import 'package:external_api/src/models/bus_route.dart';
import 'package:external_api/src/models/bus_route_stop.dart';
import 'package:external_api/src/models/bus_service.dart';
import 'package:external_api/src/models/bus_stop.dart';
import 'package:external_api/src/models/bus_stop_timings.dart';
import 'package:external_api/src/models/bus_timings.dart';
import 'package:external_api/src/parsers/route_parser.dart';
import 'package:external_api/src/parsers/service_parser.dart';
import 'package:external_api/src/parsers/stop_parser.dart';
import 'package:external_api/src/parsers/timing_parser.dart';

const String PROTOCOL = "http://";
const String HOSTNAME = "datamall2.mytransport.sg";
const String PATH = "/ltaodataservice/";

const String PAGE_BUS_ARRIVAL = "BusArrivalv2";
const String PAGE_BUS_ROUTES = "BusRoutes";
const String PAGE_BUS_SERVICES = "BusServices";
const String PAGE_BUS_STOPS = "BusStops";

const int MAX_API_RETURN_VALUE = 500;

class Api {
  var httpClient = new HttpClient();

  String _API_KEY;
  final String BASE_URL = "${PROTOCOL}${HOSTNAME}${PATH}";

  String _buildBusArrivalUrl() => _buildUrl(PAGE_BUS_ARRIVAL);
  String _buildBusRoutesUrl(skip) => _buildUrl(PAGE_BUS_ROUTES, skip);
  String _buildBusServicesUrl(skip) => _buildUrl(PAGE_BUS_SERVICES, skip);
  String _buildBusStopsUrl(skip) => _buildUrl(PAGE_BUS_STOPS, skip);

  Api(this._API_KEY);

  String _buildUrl(String page, [skip = 0]) {
    return "${BASE_URL}${page}${skip != 0 ? "?\$skip=${skip}" : ""}";
  }

  Future<Stream> _get(String url) async {
    try {
      var request = await httpClient.getUrl(Uri.parse("${url}"));
      request.headers.set("AccountKey", _API_KEY);
      request.headers.set("Accept", "applicatipn/json");

      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        Stream jsonStream = response.transform(utf8.decoder);
        return jsonStream;
      } else if (response.statusCode == HttpStatus.internalServerError) {
        var error = await response.transform(utf8.decoder).join("");
        print(error);
      } else {
        print("[-] Unknown Status Code: ${response.statusCode}");
      }
    } catch (exception) {
      print(exception.toString());
    }
  }

  Future<BusStopTimings> getBusStopTimings(int busStopCode) async {
    Stream s =
        await _get("${_buildBusArrivalUrl()}?BusStopCode=${busStopCode}");

    Map jsonMap = json.decode(await s.join(""));
    return TimingParser.toBusStopTimings(jsonMap);
  }

  Future<BusServiceTimings> getBusServiceTimings(
      int busStopCode, String serviceNumber) async {
    Stream s = await _get(
        "${_buildBusArrivalUrl()}?BusStopCode=${busStopCode}&ServiceNo=${serviceNumber}");
    Map jsonMap = json.decode(await s.join(""));
    return TimingParser.toBusServiceTimings(jsonMap);
  }

  Future<BusRoute> getBusRoutes(skip) {
    return _buildRoutes(skip);
  }

  Future<List<BusService>> getBusServices(skip) async {
    return _buildServices(skip);
  }

  Future<List<BusStop>> getBusStops(skip) async {
    return _buildStops(skip);
  }

  bool isValueEmpty(Map jsonMap) =>
      jsonMap.containsKey("value") && jsonMap["value"].isEmpty;

  Future<BusRoute> _buildRoutes(skip) async {
    BusRoute busRoute = BusRoute();
    Stream s = await _get(_buildBusRoutesUrl(skip));
    Map jsonMap = json.decode(await s.join(""));

    if (isValueEmpty(jsonMap)) {
      return busRoute;
    }
    List<Map> routeFragments = jsonMap["value"];

    routeFragments
        .forEach((frag) => busRoute.routeStops.add(RouteParser.parse(frag)));

    return busRoute;
  }

  Future<List<BusService>> _buildServices(skip) async {
    List<BusService> services = [];
    Stream s = await _get(_buildBusServicesUrl(skip));
    Map jsonMap = json.decode(await s.join(""));

    if (isValueEmpty(jsonMap)) return services;

    List<Map> serviceFragments = jsonMap["value"];

    serviceFragments.forEach((frag) => services.add(ServiceParser.parse(frag)));

    return services;
  }

  //Todo can refracter to generalize better
  Future<List<BusStop>> _buildStops(skip) async {
    List<BusStop> busStops = [];
    Stream s = await _get(_buildBusStopsUrl(skip));
    Map jsonMap = json.decode(await s.join(""));

    if (isValueEmpty(jsonMap)) return busStops;

    List<Map> serviceFragments = jsonMap["value"];

    serviceFragments.forEach((frag) => busStops.add(StopParser.parse(frag)));

    return busStops;
  }
}
