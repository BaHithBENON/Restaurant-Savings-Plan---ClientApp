import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../controllers/contribution_controller.dart';
import '../../models/model_account.dart';
import '../../models/model_beneficiary.dart';
import '../../utilities/config/text_config.dart';
import 'update_beneficiary_ui.dart';
import 'widgets/beneficiary_item_widget.dart';

class BeneficiariesUI extends StatelessWidget {
  final ModelAccount? account;
  const BeneficiariesUI({ Key? key, this.account }) : super(key: key);


  void _goToUpdateBeneficiaryUpdate() {
    if (account != null) {
      Get.bottomSheet(UpdateBeneficiaryUI(account: account!));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: ()=> _goToUpdateBeneficiaryUpdate(),
        child: const CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).canvasColor,
                  child: const Icon(Icons.close)
                ),
              ),
              const SizedBox(height: 20),
              Text("Beneficiaries",
                style: TextConfig.getSimpleTextStyle(true),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<ModelBeneficiary>?>(
                  future: ContributionController.INSTANCE.getAccountBeneficiary(
                    accountNumber: account?.number ?? ""
                  ),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if(snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                        List<ModelBeneficiary> beneficiaries = snapshot.data ?? List.castFrom([]);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(beneficiaries.length, (index) => 
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: BeneficiaryItemWidget(
                                  account: account!, 
                                  beneficiary: beneficiaries[index],
                                  creditCard: account!.creditCard!,
                                ),
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
                              Icon(TablerIcons.wallet, size: 100, color: Theme.of(context).canvasColor,),
                              Text("No beneficiries!",
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