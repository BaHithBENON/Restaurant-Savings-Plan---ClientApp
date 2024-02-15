import 'dart:convert';

class ModelAccountContributionRequest {
  int? id;
  String? name;
  String? ccnumber;
  String? anumber;
  double? percentage;

  ModelAccountContributionRequest({
    this.id,
    this.name,
    this.ccnumber,
    this.anumber,
    this.percentage,
  });

  factory ModelAccountContributionRequest.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelAccountContributionRequest.fromMap(jsonMap);
  }

  factory ModelAccountContributionRequest.fromMap(Map<String, dynamic> map) {
    return ModelAccountContributionRequest(
      id: map['id'],
      name: map['name'],
      ccnumber: map['credit_card_number'],
      anumber: map['account_number'],
      percentage: map['allocation_percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'credit_card_number': ccnumber,
      'account_number': anumber,
      'allocation_percentage': percentage,
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
