import 'dart:convert';

import 'model_account.dart';

class ModelCreditCard {
  int? id;
  String? number;
  ModelAccount? account;

  ModelCreditCard({this.id, this.number, this.account});

  factory ModelCreditCard.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelCreditCard.fromMap(jsonMap);
  }

  factory ModelCreditCard.fromMap(Map<String, dynamic> map) {
    return ModelCreditCard(
      id: map['id'],
      number: map['number'],
      account: map['account'] != null ? ModelAccount.fromMap(map['account']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'credit_card_number': number,
      'account': account?.toMap(),
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
