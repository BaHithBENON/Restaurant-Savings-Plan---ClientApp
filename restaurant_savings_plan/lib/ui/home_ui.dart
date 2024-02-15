import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../utilities/config/text_config.dart';
import '../utilities/variables/app_texts.dart';
import '../utilities/variables/fonts_names.dart';
import 'contributions/contribution_ui.dart';
import 'restaurants/calculation_benefit_ui.dart';
import 'restaurants/restaurants_ui.dart';
import 'rewards/distribute_rewards_ui.dart';
import 'rewards/rewards_ui.dart';
import 'settings/settings_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({ Key? key }) : super(key: key);

  static void updateMainBloc(BuildContext context, Widget bloc) {
    _HomeUIState? state = context.findAncestorStateOfType<_HomeUIState>();
    state?.updateMainBloc(bloc);
  }

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {

  Widget? _mainBloc; 
  void updateMainBloc(Widget bloc) {
    setState(() {
      _mainBloc = bloc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).canvasColor,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              updateMainBloc(const RewardsUI());
                            },
                            child: const Icon(TablerIcons.trophy),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              updateMainBloc(const RestaurantsUI());
                            },
                            child: const Icon(Icons.fastfood_rounded),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              updateMainBloc(const ContributionUI());
                            },
                            child: const Icon(TablerIcons.user_filled),
                          ),
                          /*
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              updateMainBloc(const BeneficiariesUI());
                            },
                            child: const Icon(TablerIcons.users_group),
                          ),
                          */
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Get.bottomSheet(const CalculationBenefitUI());
                            },
                            child: const Icon(TablerIcons.calculator),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Get.bottomSheet(const DistributeRewardsUI());
                            },
                            child: const Icon(TablerIcons.cards),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.appName,
                          style: TextConfig.getSimpleTextStyle(true, font: FontsNames.fontKablammo),
                        ),
                        Text(AppStrings.subTitle,
                          style: TextConfig.getSimpleTextStyle(true, size: 10, font: FontsNames.fontComforterBrush),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      updateMainBloc(const SettingsUI());
                    },
                    child: const Icon(TablerIcons.menu_2),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _mainBloc ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}