import 'dart:convert';
import 'package:intl/intl.dart';

class ModelReward {
  int? id;
  int? confirmationNumber;
  double? amount;
  int? merchantNumber;
  DateTime? rewardDate;
  String? executionChain;

  ModelReward({
    this.id,
    this.confirmationNumber,
    this.amount,
    this.merchantNumber,
    this.rewardDate,
    this.executionChain,
  });

  factory ModelReward.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelReward.fromMap(jsonMap);
  }

  factory ModelReward.fromMap(Map<String, dynamic> map) {
    return ModelReward(
      id: map['id'],
      confirmationNumber: map['confirmationNumber'],
      amount: map['amount'],
      merchantNumber: map['merchantNumber'],
      rewardDate: map['rewardDate'] != null ? DateTime.parse(map['rewardDate']) : null,
      executionChain: map['executionChain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'confirmation_number': confirmationNumber,
      'amount': amount,
      'merchantNumber': merchantNumber,
      'rewardDate': rewardDate != null ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(rewardDate!) : null,
      'executionChain': executionChain,
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
