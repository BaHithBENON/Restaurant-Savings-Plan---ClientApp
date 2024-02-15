class ApiRoutes {
  static const String apiPreffix = "http://localhost:8765";

  // /account-contribution
  static const String accUrlBase = "$apiPreffix/account-contribution";
  static String accUrlPostAccounts = "$accUrlBase/accounts";
  static String accUrlGetAccount = "$accUrlBase/accounts/{account_number}";
  static String accUrlGetAccounts = "$accUrlBase/accounts";
  static String accUrlPostBeneficiaries = "$accUrlBase/accounts/{account_number}/beneficiaries";
  static String accUrlPutBeneficiaries = "$accUrlBase/accounts/beneficiaries/{id}";
  static String accUrlGetBeneficiaries = "$accUrlBase/accounts/{account_number}/beneficiaries";
  static String accUrlPutReward = "$accUrlBase/accounts/{credit_card_number}/reward/{reward}";
  static String accUrlGetAllCreditCards = "$accUrlBase/accounts/creditcards";
  static String accUrlGetCreditCard = "$accUrlBase/accounts/account-specific-credit-card";

  // /benefit-calculation
  static const String calculationUrlBase = "$apiPreffix/benefit-calculation";
  static String calculationUrlGetBenefit = "$calculationUrlBase/v3/{merchantNumber}/{diningAmount}";

  // /benefit-restaurant
  static const String restoUrlBase = "$apiPreffix/benefit-restaurant";
  static const String restoUrlGetMerchant = "$restoUrlBase/merchants/{merchant_number}";
  static const String restoUrlGetAll = "$restoUrlBase/all";
  static const String restoUrlPostAdd = "$restoUrlBase/add";
  static const String restoUrlPatchSuspend = "$restoUrlBase/suspend/{id}";
  static const String restoUrlPutUpdate = "$restoUrlBase/update/{id}";
  static const String restoUrlPatchUpdate = "$restoUrlBase/update/{id}";

  // /reward-manager
  static const String rewardUrlBase = "$apiPreffix/reward-manager";
  static const String rewardUrlGetReward = "$rewardUrlBase/rewards/{confirmationNumber}";
  static const String rewardUrlGetAllRewards = "$rewardUrlBase/rewards";
  static const String rewardUrlGetRewardV2 = "$rewardUrlBase/rewards/v2/{id}";
  static const String rewardUrlPostRewards = "$rewardUrlBase/rewards";
  static const String rewardUrlPostDistribute = "$rewardUrlBase/rewards/{confirmationNumber}/distribute/{credit_card_number}";


  static String replaceUrlParams(List<dynamic> values, String url) {
    // Copie de l'URL pour ne pas la modifier directement
    String modifiedUrl = url;

    // Boucle à travers les valeurs et remplacement des paramètres dans l'URL
    for (int i = 0; i < values.length; i++) {
      modifiedUrl = modifiedUrl.replaceFirst(RegExp('{.*?}'), values[i].toString());
    }

    return modifiedUrl;
  }

}