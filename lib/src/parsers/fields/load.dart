import 'package:external_api/src/types.dart';

class Load {
  static int parse(String field) {
    switch (field) {
      case LOAD_STRING_SEATS_AVAILABLE:
        return LOAD_SEATS_AVAILABLE;
      case LOAD_STRING_STANDING_AVAILABLE:
        return LOAD_STANDING_AVAILABLE;
      case LOAD_STRING_LIMITED_STANDING:
        return LOAD_LIMITED_STANDING;
      default:
        return LOAD_UNKNOWN;
    }
  }
}
