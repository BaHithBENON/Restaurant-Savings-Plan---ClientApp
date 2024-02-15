import 'dart:convert';

class ModelDining {
  int id;
  String creditCardNumber;
  int merchantNumber;
  double diningAmount;
  String diningDate;
  String? executionChain;

  ModelDining({
    required this.id,
    required this.creditCardNumber,
    required this.merchantNumber,
    required this.diningAmount,
    required this.diningDate,
    this.executionChain,
  });

  factory ModelDining.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelDining.fromMap(jsonMap);
  }

  factory ModelDining.fromMap(Map<String, dynamic> map) {
    return ModelDining(
      id: map['id'],
      creditCardNumber: map['creadit_card_number'],
      merchantNumber: map['merchant_number'],
      diningAmount: map['dining_amount'],
      diningDate: map['dining_date'],
      executionChain: map['executionChain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creadit_card_number': creditCardNumber,
      'merchant_number': merchantNumber,
      'dining_amount': diningAmount,
      'dining_date': diningDate,
      'executionChain': executionChain,
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
