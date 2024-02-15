import 'dart:convert';

class ModelConfirmation {
  int rewardConfirmation;
  String? executionChain;

  ModelConfirmation({required this.rewardConfirmation, this.executionChain});

  factory ModelConfirmation.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ModelConfirmation.fromMap(jsonMap);
  }

  factory ModelConfirmation.fromMap(Map<String, dynamic> map) {
    return ModelConfirmation(
      rewardConfirmation: map['reward_confirmation_number'],
      executionChain: map['executionChain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reward_confirmation_number': rewardConfirmation,
      'executionChain': executionChain,
    };
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
