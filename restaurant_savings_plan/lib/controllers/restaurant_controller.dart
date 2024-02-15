

// ignore_for_file: non_constant_identifier_names

import '../api/api_routes_provider.dart';
import '../models/model_restaurant.dart';

class RestaurantController {

  RestaurantController._();
  static final RestaurantController INSTANCE = RestaurantController._();

  Future<String?> createRestaurant({
    required ModelRestaurant request
  }) async {
    return ApiRoutesProvider.createRestaurant(request: request);
  }

  Future<List<ModelRestaurant>?> getAllRestaurants() async {
    return ApiRoutesProvider.getAllRestaurants();
  }

  Future<ModelRestaurant?> getRestaurant({
    required int merchantNumber
  }) async {
    return ApiRoutesProvider.getRestaurant(merchantNumber: merchantNumber);
  }

  Future<String?> suspendRestaurant({
    required int id, 
    required bool suspended
  }) async {
    return ApiRoutesProvider.suspendRestaurant(id: id, suspended: suspended);
  }

  Future<ModelRestaurant?> updateRestaurant({
    required int id, 
    required ModelRestaurant updatedRestaurant
  }) async {
    return ApiRoutesProvider.updateRestaurant(id: id, updatedRestaurant: updatedRestaurant);
  }

  Future<ModelRestaurant?> partialUpdateRestaurant({
    required int id, 
    required Map<String, dynamic> updatesFields
  }) async {
    return ApiRoutesProvider.partialUpdateRestaurant(id: id, updatesFields: updatesFields);
  }

}