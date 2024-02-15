import 'dart:convert';

import 'model_beneficiary.dart';
import 'model_credit_card.dart';

class ModelAccount {
  int? id;
  String? owner;
  String? number;
  double? benefits;
  List<ModelBeneficiary>? beneficiaries;
  ModelCreditCard? creditCard;

  ModelAccount({this.id, this.owner, this.number, this.benefits, this.beneficiaries, this.creditCard});

  factory ModelAccount.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelAccount.fromMap(jsonMap);
  }

  factory ModelAccount.fromMap(Map<String, dynamic> map) {
    return ModelAccount(
      id: map['id'],
      owner: map['owner'],
      number: map['account_number'],
      benefits: map['total_benefits'],
      beneficiaries: (map['beneficiaries'] as List<dynamic>?)?.map((e) => ModelBeneficiary.fromMap(e)).toList(),
      creditCard: map['credit_card'] != null ? ModelCreditCard.fromMap(map['credit_card']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner': owner,
      'account_number': number,
      'total_benefits': benefits,
      'beneficiaries': beneficiaries?.map((e) => e.toMap()).toList(),
      'credit_card': creditCard?.toMap(),
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
