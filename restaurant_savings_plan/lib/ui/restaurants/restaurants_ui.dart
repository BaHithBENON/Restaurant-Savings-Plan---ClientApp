import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/restaurant_controller.dart';
import '../../models/model_restaurant.dart';
import '../../utilities/config/text_config.dart';
import 'update_restaurant_ui.dart';
import 'widgets/restaurant_item_widget.dart';

class RestaurantsUI extends StatefulWidget {
  const RestaurantsUI({ Key? key }) : super(key: key);

  @override
  State<RestaurantsUI> createState() => _RestaurantsUIState();
}

class _RestaurantsUIState extends State<RestaurantsUI> {

  void _goToUpdate() {
    Get.bottomSheet(const UpdateRestaurantUI());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: ()=> _goToUpdate(),
        child: const CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Restaurants",
                style: TextConfig.getSimpleTextStyle(true),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<ModelRestaurant>?>(
                  future: RestaurantController.INSTANCE.getAllRestaurants(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if(snapshot.hasData && snapshot.data != null) {
                        List<ModelRestaurant> restaurants = snapshot.data ?? List.castFrom([]);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(restaurants.length, (index) => 
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: RestaurantItemWidget(restaurant: restaurants[index]),
                              )
                            ),
                          ],
                        );
                      } else {
                        return SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fastfood_rounded, size: 100, color: Theme.of(context).canvasColor,),
                              Text("No restaurant!",
                                textAlign: TextAlign.center,
                                style: TextConfig.getSimpleTextStyle(true, size: 30, color: Theme.of(context).canvasColor),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}