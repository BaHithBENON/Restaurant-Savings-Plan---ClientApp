import 'dart:convert';

class ModelBenefitCalculation {
  String benefitAmount;

  ModelBenefitCalculation({required this.benefitAmount});

  factory ModelBenefitCalculation.fromJson(String jsonString) {
    return ModelBenefitCalculation.fromMap(json.decode(jsonString));
  }

  factory ModelBenefitCalculation.fromMap(Map<String, dynamic> map) {
    return ModelBenefitCalculation(
      benefitAmount: map['benefitAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'benefitAmount': benefitAmount,
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
