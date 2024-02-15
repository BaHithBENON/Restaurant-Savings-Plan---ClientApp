// ignore_for_file: non_constant_identifier_names

import '../api/api_routes_provider.dart';
import '../models/model_benefit_restaurant.dart';

class CalculationController {

  CalculationController._();
  static final CalculationController INSTANCE = CalculationController._();
  
  Future<ModelBenefitRestaurant?> calculateBenefit({
    required int merchantNumber,
    required double diningAmount
  }) async {
    return ApiRoutesProvider.calculateBenefit(merchantNumber: merchantNumber, diningAmount: diningAmount);
  }
}