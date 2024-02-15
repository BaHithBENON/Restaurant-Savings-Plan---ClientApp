import 'dart:convert';

import 'model_benefit_restaurant.dart';

class ModelBenefitRestaurantDetails extends ModelBenefitRestaurant {
  int id;
  int merchantNumber;
  String name;
  double benefitPercentage;
  String benefitAvailabilityPolicy;
  String? executionChain;

  ModelBenefitRestaurantDetails({
    required this.id,
    required this.merchantNumber,
    required this.name,
    required this.benefitPercentage,
    required this.benefitAvailabilityPolicy,
    this.executionChain,
  }) : super();

  factory ModelBenefitRestaurantDetails.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelBenefitRestaurantDetails.fromMap(jsonMap);
  }

  factory ModelBenefitRestaurantDetails.fromMap(Map<String, dynamic> map) {
    return ModelBenefitRestaurantDetails(
      id: map['id'],
      merchantNumber: map['merchantNumber'],
      name: map['name'],
      benefitPercentage: map['benefitPercentage'],
      benefitAvailabilityPolicy: map['benefitAvailabilityPolicy'],
      executionChain: map['executionChain'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['id'] = id;
    data['merchantNumber'] = merchantNumber;
    data['name'] = name;
    data['benefitPercentage'] = benefitPercentage;
    data['benefitAvailabilityPolicy'] = benefitAvailabilityPolicy;
    data['executionChain'] = executionChain;
    return data;
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
