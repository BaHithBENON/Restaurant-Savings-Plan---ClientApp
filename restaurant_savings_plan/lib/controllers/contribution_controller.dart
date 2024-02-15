// ignore_for_file: non_constant_identifier_names

import '../api/api_routes_provider.dart';
import '../models/model_account.dart';
import '../models/model_account_contribution_request.dart';
import '../models/model_account_contribution_response.dart';
import '../models/model_beneficiary.dart';
import '../models/model_credit_card.dart';

class ContributionController {

  ContributionController._();
  static final ContributionController INSTANCE = ContributionController._();

  Future<ModelAccountContributionResponse?> createAccount({required ModelAccountContributionRequest request}) async {
    return ApiRoutesProvider.createAccount(request: request);
  }

  Future<ModelAccount?> getAccount({required String accountNumber}) async {
    return ApiRoutesProvider.getAccount(accountNumber: accountNumber);
  }

  Future<List<ModelAccount>?> getAccounts() async {
    return ApiRoutesProvider.getAccounts();
  }

  Future<ModelAccountContributionResponse?> createBeneficiary({
    required ModelAccountContributionRequest request,
    required String accountNumber
  }) async {
    return ApiRoutesProvider.createBeneficiary(request: request, accountNumber: accountNumber);
  }

  Future<ModelAccountContributionResponse?> updateBeneficiary({
    required ModelAccountContributionRequest request,
    required int id
  }) async {
    return ApiRoutesProvider.updateBeneficiary(request: request, id: id);
  }

  Future<List<ModelBeneficiary>?> getAccountBeneficiary({required String accountNumber}) async {
    return ApiRoutesProvider.getAccountBeneficiary(accountNumber: accountNumber);
  }

  Future<ModelAccountContributionResponse?> distributeReward({
    required String ccNumber,
    required int confirmationNumber
  }) async {
    return ApiRoutesProvider.distributeReward(ccNumber: ccNumber, confirmationNumber: confirmationNumber);
  }

  Future<List<ModelCreditCard>?> getCreditCards() async {
    return ApiRoutesProvider.getCreditCards();
  }

  Future<ModelCreditCard?> getAccountCreditCard({required ModelAccountContributionRequest request}) async {
    return ApiRoutesProvider.getAccountCreditCard(request: request);
  }
}