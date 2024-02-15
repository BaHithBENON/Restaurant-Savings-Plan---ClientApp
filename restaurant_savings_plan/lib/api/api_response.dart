import 'package:http/http.dart';
import '../utilities/variables/enums.dart';
import '../utilities/variables/models_attributs.dart';
import '../utilities/variables/strings_to_enums.dart';

class ApiResponse {
  int responseCode;
  ApiResponseStatus? responseStatus;
  String? responseMessage;
  String? responseComment;
  dynamic responseBody;

  ApiResponse(
      {required this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.responseComment,
      this.responseBody});

  factory ApiResponse.toApiResponse(Map<String, dynamic> datas) {
    return ApiResponse(
      responseCode: StringsToEnums.apiResponseStatusCode(datas[ModelsAttributs.STATUS]),
      responseComment: datas[ModelsAttributs.MESSAGE],
      responseMessage: datas[ModelsAttributs.MESSAGE],
      responseStatus: StringsToEnums.apiResponseStatus(datas[ModelsAttributs.STATUS]),
      responseBody: datas[ModelsAttributs.DATA],
    );
  }

  factory ApiResponse.toResponse(Response response) {
    return ApiResponse(
      responseCode: response.statusCode,
      responseComment: response.reasonPhrase,
      responseMessage: response.reasonPhrase,
      responseBody: response.body,
    );
  }

  Map<String, dynamic> toMap(ApiResponse datas) {
    return <String, dynamic>{
      ModelsAttributs.RESPONSE_CODE: responseCode,
      ModelsAttributs.RESPONSE_COMMENT: responseComment,
      ModelsAttributs.RESPONSE_MESSAGE: responseMessage,
      ModelsAttributs.RESPONSE_BODY: responseBody,
    };
  }
}
