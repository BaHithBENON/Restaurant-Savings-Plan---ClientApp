import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../controllers/reward_controller.dart';
import '../../models/model_reward.dart';
import '../../utilities/config/text_config.dart';
import 'update_reward_ui.dart';
import 'widgets/reward_widget.dart';

class RewardsUI extends StatefulWidget {
  const RewardsUI({ Key? key }) : super(key: key);
  @override
  State<RewardsUI> createState() => _RewardsUIState();
}

class _RewardsUIState extends State<RewardsUI> {

  TextEditingController? _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController?.dispose();
    super.dispose();
  }

  void _goToUpdate() {
    Get.bottomSheet(const UpdateRewardUI());
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
              Text("Rewards",
                style: TextConfig.getSimpleTextStyle(true),
              ),
              //
              Expanded( 
                child: FutureBuilder<List<ModelReward>?>(
                  future: RewardController.INSTANCE.getAllRewards(), 
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if(snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                        List<ModelReward>? rewards = snapshot.data ?? List.castFrom([]);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(rewards.length, (index) => 
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: RewardWidget(reward: rewards[index]),
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
                              Icon(TablerIcons.trophy, size: 100, color: Theme.of(context).canvasColor,),
                              Text("No reward!",
                                textAlign: TextAlign.center,
                                style: TextConfig.getSimpleTextStyle(true, size: 30, color: Theme.of(context).canvasColor),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}