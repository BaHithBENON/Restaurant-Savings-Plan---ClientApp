import 'dart:convert';

import 'model_account.dart';

class ModelBeneficiary {
  int? id;
  double? percentage;
  String? name;
  double? savings;
  ModelAccount? account;

  ModelBeneficiary({this.id, this.percentage, this.name, this.savings, this.account});

  factory ModelBeneficiary.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelBeneficiary.fromMap(jsonMap);
  }

  factory ModelBeneficiary.fromMap(Map<String, dynamic> map) {
    return ModelBeneficiary(
      id: map['id'],
      percentage: map['percentage'],
      name: map['name'],
      savings: map['savings'],
      account: map['account'] != null ? ModelAccount.fromMap(map['account']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'allocation_percentage': percentage,
      'name': name,
      'savings': savings,
      'account': account?.toMap(),
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}