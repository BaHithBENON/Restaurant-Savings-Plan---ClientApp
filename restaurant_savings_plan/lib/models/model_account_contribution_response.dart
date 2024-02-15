import 'dart:convert';

class ModelAccountContributionResponse {
  int? code;
  String? message;
  String? executionChain;

  ModelAccountContributionResponse({this.code, this.message, this.executionChain});

  factory ModelAccountContributionResponse.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelAccountContributionResponse.fromMap(jsonMap);
  }

  factory ModelAccountContributionResponse.fromMap(Map<String, dynamic> map) {
    return ModelAccountContributionResponse(
      code: map['status_code'],
      message: map['message'],
      executionChain: map['executionChain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status_code': code,
      'message': message,
      'executionChain': executionChain,
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}