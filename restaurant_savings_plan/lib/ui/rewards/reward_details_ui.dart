import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/model_reward.dart';
import '../../utilities/config/text_config.dart';
import '../widgets/button_widget.dart';
import 'distribute_rewards_ui.dart';
// import 'update_reward_ui.dart';

class RewardDetailsUI extends StatelessWidget {
  final ModelReward reward;
  const RewardDetailsUI({ Key? key, required this.reward }) : super(key: key);

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
                    text: reward.id.toString(),
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
                    text: "Confirmation N° : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: "${reward.confirmationNumber ?? 0}",
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
                    text: "Amount : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: "XOF ${reward.amount ?? 0.0}",
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
                    text: "${reward.merchantNumber ?? 0}",
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
                    text: "Date : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: "${reward.rewardDate!} ",
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                ]), 
                style: TextConfig.getSimpleTextStyle(false),
              ),
              const SizedBox(height: 20),
              /*
              ButtonWidget(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(UpdateRewardUI(reward: reward));
                },
                text: "Update",
                background: Theme.of(context).canvasColor,
                withRadius: true,
              ),
              const SizedBox(height: 5),
              */
              ButtonWidget(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(DistributeRewardsUI(confirmationNumber: reward.confirmationNumber));
                },
                text: "Distribute",
                background: Theme.of(context).canvasColor,
                withRadius: true,
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}