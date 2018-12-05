import 'package:external_api/src/types.dart';

class Category {
//  Category of the SBS bus service:
//  EXPRESS, FEEDER, INDUSTRIAL,
//  TOWNLINK, TRUNK, 2 TIER FLAT FEE,
//  FLAT FEE $1.10 (or $1.90, $3.50, $3.80)

  static int parse(String field) {
    switch (field) {
      case CATEGORY_STRING_EXPRESS:
        return CATEGORY_EXPRESS;
      case CATEGORY_STRING_FEEDER:
        return CATEGORY_FEEDER;
      case CATEGORY_STRING_INDUSTRIAL:
        return CATEGORY_INDUSTRIAL;
      case CATEGORY_STRING_TOWNLINK:
        return CATEGORY_TOWNLINK;
      case CATEGORY_STRING_TRUNK:
        return CATEGORY_TRUNK;
      case CATEGORY_STRING_2_TIER_FLAT_FEE:
        return CATEGORY_2_TIER_FLAT_FEE;
      case CATEGORY_STRING_FLAT_FEE_1_10:
        return CATEGORY_FLAT_FEE_1_10;
      case CATEGORY_STRING_FLAT_FEE_1_90:
        return CATEGORY_FLAT_FEE_1_90;
      case CATEGORY_STRING_FLAT_FEE_3_50:
        return CATEGORY_FLAT_FEE_3_50;
      case CATEGORY_STRING_FLAT_FEE_3_80:
        return CATEGORY_FLAT_FEE_3_80;

      default:
        return LOAD_UNKNOWN;
    }
  }
}
