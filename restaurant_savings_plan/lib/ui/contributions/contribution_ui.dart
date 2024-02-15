import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../controllers/contribution_controller.dart';
import '../../models/model_account.dart';
import '../../utilities/config/text_config.dart';
import 'update_account_ui.dart';
import 'widgets/account_item_widget.dart';

class ContributionUI extends StatefulWidget {
  const ContributionUI({ Key? key }) : super(key: key);

  @override
  State<ContributionUI> createState() => _ContributionUIState();
}

class _ContributionUIState extends State<ContributionUI> {

  void _goToUpdateAccount() {
    Get.bottomSheet(const UpdateAccountUI());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: ()=> _goToUpdateAccount(),
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
              Text("Accounts",
                style: TextConfig.getSimpleTextStyle(true),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<ModelAccount>?>(
                  future: ContributionController.INSTANCE.getAccounts(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if(snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                        List<ModelAccount> accounts = snapshot.data ?? List.castFrom([]);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(accounts.length, (index) => 
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: AccountItemWidget(account: accounts[index]),
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
                              Text("No account!",
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