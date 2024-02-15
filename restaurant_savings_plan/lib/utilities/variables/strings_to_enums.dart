
import 'enums.dart';
import 'enums_values_strings.dart';

class StringsToEnums {
  // String to StatusValue
  static StatusValue statusValue(String value) {
    StatusValue converted = StatusValue.Waiting;
    switch (value) {
      case EnumsValuesStrings.ACCEPTED:
        converted = StatusValue.Accepted;
        break;
      case EnumsValuesStrings.REFUSED:
        converted = StatusValue.Refused;
        break;
      case EnumsValuesStrings.WAITING:
        converted = StatusValue.Waiting;
        break;
      default:
        converted = StatusValue.Waiting;
    }
    return converted;
  }

  static RatingEvaluations ratingValue(String value) {
    RatingEvaluations converted = RatingEvaluations.Mediocre;
    switch (value) {
      case EnumsValuesStrings.EXCELLENT:
        converted = RatingEvaluations.Excellent;
        break;
      case EnumsValuesStrings.TRES_BIEN:
        converted = RatingEvaluations.TresBien;
        break;
      case EnumsValuesStrings.BIEN:
        converted = RatingEvaluations.Bien;
        break;
      case EnumsValuesStrings.PASSABLE:
        converted = RatingEvaluations.Passable;
        break;
      case EnumsValuesStrings.MEDIOCRE:
        converted = RatingEvaluations.Mediocre;
        break;
      default:
        converted = RatingEvaluations.Mediocre;
    }
    return converted;
  }

  static ApiResponseStatus apiResponseStatus(String status) {
    ApiResponseStatus response = ApiResponseStatus.SUCCESS;
    switch (status) {
      case EnumsValuesStrings.SUCCESS:
        response = ApiResponseStatus.SUCCESS;
        break;
      case EnumsValuesStrings.FAILURE:
        response = ApiResponseStatus.FAILURE;
        break;
      default:
        response = ApiResponseStatus.FAILURE;
    }
    return response;
  }

  static int apiResponseStatusCode(String status) {
    int response = 200;
    switch (status) {
      case EnumsValuesStrings.SUCCESS:
        response = 200;
        break;
      case EnumsValuesStrings.FAILURE:
        response = 500;
        break;
      default:
        response = 200;
    }
    return response;
  }


}
