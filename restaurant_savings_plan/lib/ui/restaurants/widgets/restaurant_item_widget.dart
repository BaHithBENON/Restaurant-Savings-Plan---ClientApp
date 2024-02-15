import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/model_restaurant.dart';
import '../../../utilities/config/text_config.dart';
import '../restaurant_details_ui.dart';

class RestaurantItemWidget extends StatelessWidget {
  final ModelRestaurant restaurant;
  const RestaurantItemWidget({ Key? key, required this.restaurant }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(RestaurantDetailsUI(restaurant: restaurant));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            Container(
              height: 50, width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // color: Colors.deepOrangeAccent,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: const Center(
                child: Icon(Icons.fastfood_rounded),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name ?? "",
                    style: TextConfig.getSimpleTextStyle(true),
                  ),
                  Text.rich(TextSpan(
                    text: "N° ${restaurant.merchantNumber!} ! ",
                    children: [
                      TextSpan(
                        text: "%${restaurant.benefitPercentage!}",
                        style: TextConfig.getSimpleTextStyle(false, color: Colors.teal),
                      ),
                    ]), 
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}