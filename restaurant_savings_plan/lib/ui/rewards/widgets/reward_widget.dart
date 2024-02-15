import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../../models/model_reward.dart';
import '../../../utilities/config/text_config.dart';
import '../reward_details_ui.dart';

class RewardWidget extends StatelessWidget {
  final ModelReward reward;
  const RewardWidget({ Key? key, required this.reward }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(RewardDetailsUI(reward: reward));
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
                child: Icon(TablerIcons.trophy_filled),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(
                    text: "Dining ",
                    children: [
                      TextSpan(
                        text: "XOF ${reward.amount ?? 0.0}",
                        style: TextConfig.getSimpleTextStyle(false, color: Colors.teal),
                      ),
                    ]), 
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                  Text.rich(TextSpan(
                    text: "Merchant N°",
                    children: [
                      TextSpan(
                        text: "${reward.merchantNumber ?? 0} ",
                        style: TextConfig.getSimpleTextStyle(false, color: Colors.teal),
                      ),
                    ]), 
                    style: TextConfig.getSimpleTextStyle(false, size: 10, ),
                  ),
                  Text.rich(TextSpan(
                    text: "",
                    children: [
                      TextSpan(
                        text: "${reward.rewardDate!} ",
                      ),
                    ]), 
                    style: TextConfig.getSimpleTextStyle(false, size: 10),
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