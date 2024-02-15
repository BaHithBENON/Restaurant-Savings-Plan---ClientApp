import 'dart:convert';

class ModelBenefitRestaurant {
  double? amount;
  String? executionChain;

  ModelBenefitRestaurant({this.amount, this.executionChain});

  factory ModelBenefitRestaurant.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelBenefitRestaurant.fromMap(jsonMap);
  }

  factory ModelBenefitRestaurant.fromMap(Map<String, dynamic> map) {
    return ModelBenefitRestaurant(
      amount: map['benefitAmount'],
      executionChain: map['executionChain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'benefitAmount': amount,
      'executionChain': executionChain,
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
