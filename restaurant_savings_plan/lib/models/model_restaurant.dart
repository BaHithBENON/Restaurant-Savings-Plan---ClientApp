import 'dart:convert';



class ModelRestaurant {

  static const String availabilityPolicyAllowed = "allowed";
  static const String availabilityPolicyNotAllowed = "not_allowed";

  int? id;
  int? merchantNumber;
  String? name;
  double? benefitPercentage;
  String? benefitAvailabilityPolicy;
  bool suspended;
  String? executionChain;

  ModelRestaurant({
    this.id,
    this.merchantNumber,
    this.name,
    this.benefitPercentage,
    this.benefitAvailabilityPolicy,
    this.suspended = false,
    this.executionChain,
  });

  factory ModelRestaurant.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelRestaurant.fromMap(jsonMap);
  }

  factory ModelRestaurant.fromMap(Map<String, dynamic> map) {
    return ModelRestaurant(
      id: map['id'],
      merchantNumber: map['merchantNumber'],
      name: map['name'],
      benefitPercentage: map['benefitPercentage'],
      benefitAvailabilityPolicy: map['benefitAvailabilityPolicy'],
      suspended: map['suspended'] ?? false,
      executionChain: map['executionChain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'merchantNumber': merchantNumber,
      'name': name,
      'benefitPercentage': benefitPercentage,
      'benefitAvailabilityPolicy': benefitAvailabilityPolicy,
      'suspended': suspended,
      'executionChain': executionChain,
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }

  @override
  int get hashCode =>
      id.hashCode ^
      merchantNumber.hashCode ^
      name.hashCode ^
      benefitPercentage.hashCode ^
      benefitAvailabilityPolicy.hashCode ^
      suspended.hashCode ^
      executionChain.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelRestaurant &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          merchantNumber == other.merchantNumber &&
          name == other.name &&
          benefitPercentage == other.benefitPercentage &&
          benefitAvailabilityPolicy == other.benefitAvailabilityPolicy &&
          suspended == other.suspended &&
          executionChain == other.executionChain;
}
