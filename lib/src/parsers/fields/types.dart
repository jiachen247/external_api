import 'package:external_api/src/types.dart';

class Type {
  static int parse(String type) {
    switch (type) {
      case TYPE_STRING_SINGLE_DECK:
        return TYPE_SINGLE_DECK;
      case TYPE_STRING_DOUBLE_DECK:
        return TYPE_DOUBLE_DECK;
      case TYPE_STRING_BENDY:
        return TYPE_BENDY;
      default:
        return TYPE_UNKNOWN;
    }
  }
}
