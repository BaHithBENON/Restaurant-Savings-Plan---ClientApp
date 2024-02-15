import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/model_account.dart';
import '../../utilities/config/text_config.dart';
// import '../home_ui.dart';
import '../widgets/button_widget.dart';
import 'beneficiaries_ui.dart';
// import 'update_account_ui.dart';

class AccountDetailsUI extends StatelessWidget {
  final ModelAccount account;
  const AccountDetailsUI({ Key? key, required this.account}) : super(key: key);

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
                    text: account.id.toString(),
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
                    text: "Name(Owner) : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: account.owner!,
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
                    text: "Benefits : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: "XOF ${account.benefits ?? 0.0}",
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
                    text: "Credit Card : ",
                    style: TextConfig.getSimpleTextStyle(true, color: Colors.teal),
                  ),
                  TextSpan(
                    text: "${account.creditCard?.number}",
                    style: TextConfig.getSimpleTextStyle(false),
                  ),
                ]), 
                style: TextConfig.getSimpleTextStyle(false),
              ),
              const SizedBox(height: 10),
              /*
              ButtonWidget(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(UpdateAccountUI(account: account));
                },
                text: "Update",
                background: Theme.of(context).canvasColor,
                withRadius: true,
              ),
              const SizedBox(height: 5),
              */
              ButtonWidget(
                onTap: () {
                  // HomeUI.updateMainBloc(context, BeneficiariesUI(account: account));
                  Get.back();
                  Get.to(BeneficiariesUI(account: account));
                },
                text: "Beneficiaries",
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