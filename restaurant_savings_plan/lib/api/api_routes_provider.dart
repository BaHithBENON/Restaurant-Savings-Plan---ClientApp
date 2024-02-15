import 'dart:convert';

import '../models/model_account.dart';
import '../models/model_account_contribution_request.dart';
import '../models/model_account_contribution_response.dart';
import '../models/model_beneficiary.dart';
import '../models/model_benefit_restaurant.dart';
import '../models/model_confirmation.dart';
import '../models/model_credit_card.dart';
import '../models/model_dining.dart';
import '../models/model_restaurant.dart';
import '../models/model_reward.dart';
import 'api_manager.dart';
import 'api_response.dart';
import 'api_routes.dart';

class ApiRoutesProvider {
  /*
  * account-contribution
  */

  // Done
  static Future<ModelAccountContributionResponse?> createAccount({required ModelAccountContributionRequest request}) async {
    ModelAccountContributionResponse? accresponse;
    String url = ApiRoutes.accUrlPostAccounts;
    ApiResponse response = await ApiManager.apiRequest(url, "POST", data: request.toJson(), header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      accresponse = ModelAccountContributionResponse.fromJson(jsonString);
    }
    return accresponse;
  }

  // Done
  static Future<ModelAccount?> getAccount({required String accountNumber}) async {
    ModelAccount? account;
    String url = ApiRoutes.replaceUrlParams([accountNumber], ApiRoutes.accUrlGetAccount);
    ApiResponse response = await ApiManager.apiRequest(url, "GET", data: accountNumber);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      account = ModelAccount.fromJson(jsonString);
    }
    return account;
  } 

  // Done
  static Future<List<ModelAccount>?> getAccounts() async {
    List<ModelAccount>? accounts = [];
    String url = ApiRoutes.accUrlGetAccounts;
    ApiResponse response = await ApiManager.apiRequest(url, "GET");
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      List<dynamic> jsonData = jsonDecode(jsonString);
      accounts = jsonData.map((item) => ModelAccount.fromMap(item)).toList();
    }
    return accounts;
  }

  // Done
  static Future<ModelAccountContributionResponse?> createBeneficiary({
    required ModelAccountContributionRequest request,
    required String accountNumber
  }) async {
    ModelAccountContributionResponse? accresponse;
    String url = ApiRoutes.replaceUrlParams([accountNumber], ApiRoutes.accUrlPostBeneficiaries);
    ApiResponse response = await ApiManager.apiRequest(url, "POST", data: request.toJson(), header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      accresponse = ModelAccountContributionResponse.fromJson(jsonString);
    }
    return accresponse;
  } 

  // Done
  static Future<ModelAccountContributionResponse?> updateBeneficiary({
    required ModelAccountContributionRequest request,
    required int id
  }) async {
    ModelAccountContributionResponse? accresponse;
    String url = ApiRoutes.replaceUrlParams([id], ApiRoutes.accUrlPutBeneficiaries);
    ApiResponse response = await ApiManager.apiRequest(url, "PUT", data: request.toJson(), header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      accresponse = ModelAccountContributionResponse.fromJson(jsonString);
    }
    return accresponse;
  } 

  // Done
  static Future<List<ModelBeneficiary>?> getAccountBeneficiary({required String accountNumber}) async {
    List<ModelBeneficiary>? beneficiaries = [];
    String url = ApiRoutes.replaceUrlParams([accountNumber], ApiRoutes.accUrlGetBeneficiaries);
    ApiResponse response = await ApiManager.apiRequest(url, "GET", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      List<dynamic> jsonData = jsonDecode(jsonString);
      beneficiaries = jsonData.map((item) => ModelBeneficiary.fromMap(item)).toList();
    }
    return beneficiaries;
  }

  // Done
  static Future<ModelAccountContributionResponse?> distributeReward({
    required int confirmationNumber,
    required String ccNumber
  }) async {
    ModelAccountContributionResponse? accresponse;
    String url = ApiRoutes.replaceUrlParams([confirmationNumber, ccNumber], ApiRoutes.rewardUrlPostDistribute);
    ApiResponse response = await ApiManager.apiRequest(url, "POST", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      accresponse = ModelAccountContributionResponse.fromJson(jsonString);
    }
    return accresponse;
  }

  // Done
  static Future<List<ModelCreditCard>?> getCreditCards() async {
    List<ModelCreditCard>? creditCards = [];
    String url = ApiRoutes.accUrlGetAllCreditCards;
    ApiResponse response = await ApiManager.apiRequest(url, "GET", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      List<dynamic> jsonData = jsonDecode(jsonString);
      creditCards = jsonData.map((item) => ModelCreditCard.fromMap(item)).toList();
    }
    return creditCards;
  }

  // Done
  static Future<ModelCreditCard?> getAccountCreditCard({required ModelAccountContributionRequest request}) async {
    ModelCreditCard? creditCard;
    String url = ApiRoutes.accUrlGetCreditCard;
    ApiResponse response = await ApiManager.apiRequest(url, "POST", data: request.toJson(), header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      creditCard = ModelCreditCard.fromJson(jsonString);
    }
    return creditCard;
  }


  /*
  * benefit-calculation
  */

  // Done
  static Future<ModelBenefitRestaurant?> calculateBenefit({
    required int merchantNumber,
    required double diningAmount
  }) async {
    ModelBenefitRestaurant? benefitRestaurant;
    String url = ApiRoutes.replaceUrlParams([merchantNumber, diningAmount], ApiRoutes.calculationUrlGetBenefit);
    ApiResponse response = await ApiManager.apiRequest(url, "GET", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      benefitRestaurant = ModelBenefitRestaurant.fromJson(jsonString);
    }
    return benefitRestaurant;
  }
  



  /*
  * benefit-restaurant
  */

  // Done
  static Future<String?> createRestaurant({
    required ModelRestaurant request
  }) async {
    String? accresponse;
    String url = ApiRoutes.restoUrlPostAdd;
    ApiResponse response = await ApiManager.apiRequest(url, "POST", data: request.toJson(), header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      accresponse = jsonString;
    }
    return accresponse;
  }

  // Done
  static Future<List<ModelRestaurant>?> getAllRestaurants() async {
    List<ModelRestaurant>? restaurants = [];
    String url = ApiRoutes.restoUrlGetAll;
    ApiResponse response = await ApiManager.apiRequest(url, "GET", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      List<dynamic> jsonData = jsonDecode(jsonString);
      restaurants = jsonData.map((item) => ModelRestaurant.fromMap(item)).toList();
    }
    return restaurants;
  }

  // Done
  static Future<ModelRestaurant?> getRestaurant({
    required int merchantNumber
  }) async {
    ModelRestaurant? restaurant;
    String url = ApiRoutes.replaceUrlParams([merchantNumber], ApiRoutes.restoUrlGetMerchant);
    ApiResponse response = await ApiManager.apiRequest(url, "GET", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      restaurant = ModelRestaurant.fromJson(jsonString);
    }
    return restaurant;
  }

  // Done
  static Future<String?> suspendRestaurant({
    required int id, 
    required bool suspended
  }) async {
    String? accresponse;
    String url = ApiRoutes.replaceUrlParams([id], ApiRoutes.restoUrlPatchSuspend);
    ApiResponse response = await ApiManager.apiRequest(url, "PATCH", data: suspended, header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      accresponse = jsonString;
    }
    return accresponse;
  }

  // Done
  static Future<ModelRestaurant?> updateRestaurant({
    required int id, 
    required ModelRestaurant updatedRestaurant
  }) async {
    ModelRestaurant? restaurant;
    String url = ApiRoutes.replaceUrlParams([id], ApiRoutes.restoUrlPutUpdate);
    ApiResponse response = await ApiManager.apiRequest(url, "PUT", data: updatedRestaurant.toJson(), header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      restaurant = ModelRestaurant.fromJson(jsonString);
    }
    return restaurant;
  }

  // Done
  static Future<ModelRestaurant?> partialUpdateRestaurant({
    required int id, 
    required Map<String, dynamic> updatesFields
  }) async {
    ModelRestaurant? restaurant;
    String url = ApiRoutes.replaceUrlParams([id], ApiRoutes.restoUrlPatchUpdate);
    ApiResponse response = await ApiManager.apiRequest(url, "PATCH", data: updatesFields, header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      restaurant = ModelRestaurant.fromJson(jsonString);
    }
    return restaurant;
  }




  /*
  * reward-manager
  */

  // Done 1123
  static Future<ModelConfirmation?> createReward({
    required ModelDining request
  }) async {
    ModelConfirmation? reward;
    String url = ApiRoutes.rewardUrlPostRewards;
    ApiResponse response = await ApiManager.apiRequest(url, "POST", data: request.toJson(), header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      reward = ModelConfirmation.fromJson(jsonString);
    }
    return reward;
  }

  static Future<List<ModelReward>?> getAllRewards() async {
    List<ModelReward>? rewards = [];
    String url = ApiRoutes.rewardUrlGetAllRewards;
    ApiResponse response = await ApiManager.apiRequest(url, "GET", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      List<dynamic> jsonData = jsonDecode(jsonString);
      rewards = jsonData.map((item) => ModelReward.fromMap(item)).toList();
    }
    return rewards;
  }

  // Done
  static Future<ModelReward?> getReward({
    required int confirmationNumber
  }) async {
    ModelReward? reward;
    String url = ApiRoutes.replaceUrlParams([confirmationNumber], ApiRoutes.rewardUrlGetReward);
    ApiResponse response = await ApiManager.apiRequest(url, "GET", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      reward = ModelReward.fromJson(jsonString);
    }
    return reward;
  }

  // Done
  static Future<ModelReward?> getRewardById({
    required int id
  }) async {
    ModelReward? reward;
    String url = ApiRoutes.replaceUrlParams([id], ApiRoutes.rewardUrlGetRewardV2);
    ApiResponse response = await ApiManager.apiRequest(url, "GET", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      reward = ModelReward.fromJson(jsonString);
    }
    return reward;
  }

  // Done
  static Future<ModelAccountContributionResponse?> distributeRewardToBeneficiaries({
    required int confirmationNumber,
    required String creditCardNumber
  }) async {
    ModelAccountContributionResponse? accresponse;
    String url = ApiRoutes.replaceUrlParams([confirmationNumber, creditCardNumber], ApiRoutes.rewardUrlPostDistribute);
    ApiResponse response = await ApiManager.apiRequest(url, "POST", header: true);
    if ((response.responseCode == 200) || response.responseCode == 201) {
      String jsonString = response.responseBody.toString();
      accresponse = ModelAccountContributionResponse.fromJson(jsonString);
    }
    return accresponse;
  }
}