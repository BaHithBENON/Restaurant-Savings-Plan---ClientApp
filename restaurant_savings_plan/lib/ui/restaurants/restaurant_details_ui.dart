import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/model_restaurant.dart';
import '../../utilities/config/text_config.dart';
import '../widgets/button_widget.dart';
import 'calculation_benefit_ui.dart';
import 'update_restaurant_ui.dart';

class RestaurantDetailsUI extends StatelessWidget {
  final ModelRestaurant restaurant;
  const RestaurantDetailsUI({ Key? key, required this.restaurant }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                text: "# ",
                children: [
                  TextSpan(
                    text: "Id : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: restaurant.id.toString(),
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                ]), 
                style: TextConfig.getSimpleTextStyle(false),
              ),
              const SizedBox(height: 10),
              Text.rich(TextSpan(
                text: "# ",
                children: [
                  TextSpan(
                    text: "Name : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: restaurant.name!,
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                ]), 
                style: TextConfig.getSimpleTextStyle(false),
              ),
              const SizedBox(height: 10),
              Text.rich(TextSpan(
                text: "# ",
                children: [
                  TextSpan(
                    text: "Merchant number : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: "${restaurant.merchantNumber!}",
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                ]), 
                style: TextConfig.getSimpleTextStyle(false),
              ),
              const SizedBox(height: 10),
              Text.rich(TextSpan(
                text: "# ",
                children: [
                  TextSpan(
                    text: "Benefit percentage : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: "${restaurant.benefitPercentage!} %",
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                ]), 
                style: TextConfig.getSimpleTextStyle(false),
              ),
              const SizedBox(height: 10),
              Text.rich(TextSpan(
                text: "# ",
                children: [
                  TextSpan(
                    text: "Benefit Availability : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: "${restaurant.benefitAvailabilityPolicy!} ",
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                ]), 
                style: TextConfig.getSimpleTextStyle(false),
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(UpdateRestaurantUI(restaurant: restaurant));
                },
                text: "Update",
                background: Theme.of(context).canvasColor,
                withRadius: true,
              ),
              const SizedBox(height: 5),
              ButtonWidget(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(CalculationBenefitUI(restaurant: restaurant));
                },
                text: "Calculate benefit",
                background: Theme.of(context).canvasColor,
                withRadius: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}