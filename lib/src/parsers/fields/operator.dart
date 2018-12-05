import 'package:external_api/src/types.dart';

class Operator {
  static int parse(String operator) {
    switch (operator) {
      case OPERATOR_STRING_SBST:
        return OPERATOR_SBST;
      case OPERATOR_STRING_SMRT:
        return OPERATOR_SMRT;
      case OPERATOR_STRING_TTS:
        return OPERATOR_TTS;
      case OPERATOR_STRING_GAS:
        return OPERATOR_GAS;
      default:
        return OPERATOR_UNKNOWN;
    }
  }
}
