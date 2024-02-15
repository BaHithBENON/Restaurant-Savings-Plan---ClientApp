import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/contribution_controller.dart';
import '../../../models/model_account.dart';
import '../../../models/model_account_contribution_request.dart';
import '../../../models/model_credit_card.dart';
import '../../../utilities/config/text_config.dart';
import '../account_details_ui.dart';

class AccountItemWidget extends StatelessWidget {
  final ModelAccount account;
  const AccountItemWidget({ Key? key, required this.account }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ModelCreditCard?>(
      future: ContributionController.INSTANCE.getAccountCreditCard(request: ModelAccountContributionRequest(
        anumber: account.number
      )),
      builder: (context, snapshot) {

        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          ModelCreditCard? creditCard;
          if(snapshot.hasData) {
            creditCard = snapshot.data;
            return InkWell(
              onTap: () {
                if(creditCard != null) {
                  account.creditCard = creditCard;
                  Get.bottomSheet(AccountDetailsUI(account: account));
                }
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
                        child: Icon(Icons.wallet),
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
                                text: account.owner!,
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
                                text: "#COMPTE ~ ",
                                style: TextConfig.getSimpleTextStyle(true, color: Colors.deepPurpleAccent),
                              ),
                              TextSpan(
                                text: account.number!,
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
                                text: "XOF ${account.benefits ?? 0}",
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
          } else {
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fastfood_rounded, size: 100, color: Theme.of(context).canvasColor,),
                  Text("Credit Card not found!",
                    textAlign: TextAlign.center,
                    style: TextConfig.getSimpleTextStyle(true, size: 30, color: Theme.of(context).canvasColor),
                  ),
                ],
              ),
            );
          }
        } 
      }
    );
  }
}