import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/contribution_controller.dart';
import '../../models/model_account_contribution_response.dart';
import '../../utilities/config/text_config.dart';
import '../result_ui.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_edit_widget_v2.dart';

class DistributeRewardsUI extends StatefulWidget {
  final int? confirmationNumber;
  final String? creditCardNumber;
  const DistributeRewardsUI({ Key? key, this.confirmationNumber, this.creditCardNumber }) : super(key: key);

  @override
  State<DistributeRewardsUI> createState() => _DistributeRewardsUIState();
}

class _DistributeRewardsUIState extends State<DistributeRewardsUI> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _cfNumberController;
  TextEditingController? _ccNumberController;

  @override
  void initState() {
    _cfNumberController = TextEditingController();
    _ccNumberController = TextEditingController();

    _initDatas();
    super.initState();
  }

  @override
  void dispose() {
    _cfNumberController?.dispose();
    _ccNumberController?.dispose();
    super.dispose();
  }

  void _initDatas() {
    if(widget.confirmationNumber != null) {
      _cfNumberController?.text = widget.confirmationNumber!.toString();
    }

    if(widget.creditCardNumber != null) {
      _ccNumberController?.text = widget.creditCardNumber!.toString();
    }
  }

  
  String _errorMessage = "";
  Future<void> _submit() async {
    _formKey.currentState?.validate();

    if (_cfNumberController!.text.isEmpty ||
        _ccNumberController!.text.isEmpty
    ) {
      // Show an error message or handle the case when fields are not filled
      setState(() {
        _errorMessage = "Something wrong. You have to check your network or informations...";
      });
      return;
    }

    // Call the updateRestaurant method from the ContributionController
    ModelAccountContributionResponse? response = await ContributionController.INSTANCE.distributeReward(
      ccNumber: _ccNumberController!.text,
      confirmationNumber: int.parse(_cfNumberController!.text)
    );

    // Handle the result of the createReward call
    if (response != null) {
      Get.back();
      Get.bottomSheet(const ResultUI(
        title: "Congragulations!",
        message: "Your distribution has been carried out successfully!",
      ));
    } else {
      // Failed to create the reward, show an error message
      setState(() {
        _errorMessage = "Something wrong. You have to check your network or informations...";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Reward distribution",
                  style: TextConfig.getSimpleTextStyle(true),
                ),
                Text(_errorMessage,
                  style: TextConfig.getSimpleTextStyle(true, size: 10, color: Colors.red),
                ),
                const SizedBox(height: 20),
                TextFieldEditWidgetV2(
                  controller: _cfNumberController!,
                  hint: "Reward Confirmation Number",
                  withRadius: true,
                  withEraser: false,
                  withTitleWhenTexting: false,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFieldEditWidgetV2(
                  controller: _ccNumberController!,
                  hint: "Credit Card Number",
                  withRadius: true,
                  withEraser: false,
                  withTitleWhenTexting: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  onTap: () async => _submit(),
                  text: "Distribute",
                  background: Colors.deepPurple,
                  withRadius: true,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}