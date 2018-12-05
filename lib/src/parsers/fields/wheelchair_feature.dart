import 'package:external_api/src/types.dart';

class WheelchairFeature {
  static bool parse(String feature) {
    return (feature == FEATURE_STRING_WHEELCHAIR_ACCESSIBLE);
  }
}
