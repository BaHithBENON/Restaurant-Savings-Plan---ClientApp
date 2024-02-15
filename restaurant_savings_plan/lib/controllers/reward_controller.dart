// ignore_for_file: non_constant_identifier_names

import '../api/api_routes_provider.dart';
import '../models/model_account_contribution_response.dart';
import '../models/model_confirmation.dart';
import '../models/model_dining.dart';
import '../models/model_reward.dart';

class RewardController {

  RewardController._();
  static final RewardController INSTANCE = RewardController._();

  Future<List<ModelReward>?> getAllRewards() async {
    return ApiRoutesProvider.getAllRewards();
  }

  Future<ModelConfirmation?> createReward({
    required ModelDining request
  }) async {
    return ApiRoutesProvider.createReward(request: request);
  }

  Future<ModelReward?> getReward({
    required int confirmationNumber
  }) async {
    return ApiRoutesProvider.getReward(confirmationNumber: confirmationNumber);
  }

  Future<ModelReward?> getRewardById({
    required int id
  }) async {
    return ApiRoutesProvider.getRewardById(id: id);
  }

  Future<ModelAccountContributionResponse?> distributeRewardToBeneficiaries({
    required int confirmationNumber,
    required String creditCardNumber
  }) async {
    return ApiRoutesProvider.distributeRewardToBeneficiaries(confirmationNumber: confirmationNumber, creditCardNumber: creditCardNumber);
  }
}