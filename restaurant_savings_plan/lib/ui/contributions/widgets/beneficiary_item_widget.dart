import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/model_account.dart';
import '../../../models/model_beneficiary.dart';
import '../../../models/model_credit_card.dart';
import '../../../utilities/config/text_config.dart';
import '../update_beneficiary_ui.dart';

class BeneficiaryItemWidget extends StatelessWidget {
  final ModelAccount account;
  final ModelBeneficiary beneficiary;
  final ModelCreditCard creditCard;
  const BeneficiaryItemWidget({ Key? key,required this.account, required this.beneficiary, required this.creditCard }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(UpdateBeneficiaryUI(account: account, beneficiary: beneficiary, creditCard: creditCard));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50, width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // color: Colors.deepOrangeAccent,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: const Center(
                child: Icon(Icons.beenhere),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(
                    text: "",
                    children: [
                      TextSpan(
                        text: "@~",
                        style: TextConfig.getSimpleTextStyle(false, color: Colors.deepOrangeAccent),
                      ),
                      TextSpan(
                        text: "[ID:${beneficiary.id}]",
                        style: TextConfig.getSimpleTextStyle(true, color: Colors.indigoAccent),
                      ),
                      TextSpan(
                        text: beneficiary.name!,
                        style: TextConfig.getSimpleTextStyle(true, color: null),
                      ),
                    ]), 
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                  //
                  Text.rich(TextSpan(
                    text: "",
                    children: [
                      TextSpan(
                        text: "#Part ~ ",
                        style: TextConfig.getSimpleTextStyle(true, color: Colors.deepPurpleAccent),
                      ),
                      TextSpan(
                        text: "% ${beneficiary.percentage ?? 0.0}",
                        style: TextConfig.getSimpleTextStyle(false, color: null),
                      ),
                    ]), 
                    style: TextConfig.getSimpleTextStyle(false, size: 10),
                  ),
                  //
                  Text.rich(TextSpan(
                    text: "#Benefits ~ ".toUpperCase(),
                    children: [
                      TextSpan(
                        text: "XOF ${beneficiary.savings ?? 0}",
                        style: TextConfig.getSimpleTextStyle(false, color: null),
                      ),
                    ]), 
                    style: TextConfig.getSimpleTextStyle(false, size: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}