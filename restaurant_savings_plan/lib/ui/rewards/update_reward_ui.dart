import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/reward_controller.dart';
import '../../models/model_confirmation.dart';
import '../../models/model_dining.dart';
import '../../models/model_reward.dart';
import '../../services/convert_timestamp.dart';
import '../../utilities/config/text_config.dart';
import '../result_ui.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_edit_widget_v2.dart';

class UpdateRewardUI extends StatefulWidget {
  final ModelReward? reward;
  const UpdateRewardUI({ Key? key, this.reward }) : super(key: key);

  @override
  State<UpdateRewardUI> createState() => _UpdateRewardUIState();
}

class _UpdateRewardUIState extends State<UpdateRewardUI> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController? _idController;
  TextEditingController? _ccNomberController;
  TextEditingController? _merchantNumberController;
  TextEditingController? _diningAmountController;

  @override
  void initState() {
    _idController = TextEditingController();
    _ccNomberController = TextEditingController();
    _merchantNumberController = TextEditingController();
    _diningAmountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _idController?.dispose();
    _ccNomberController?.dispose();
    _merchantNumberController?.dispose();
    _diningAmountController?.dispose();
    _diningDateTime = null;
    super.dispose();
  }

  DateTime? _diningDateTime;
  Future<void> _handleDate() async {
    var selectedDate = await ConvertTimestamp.showTheDatePicker(context);
    setState(() {
      _diningDateTime = selectedDate;
    });
  }

  TimeOfDay? _diningTime;
  Future<void> _handleTime() async {
    var time = await ConvertTimestamp.showTheTimePicker(context);
    setState(() {
      _diningTime = time;
    });
  }

  Future<void> _handleDateTime() async {
    await _handleDate();
    await _handleTime();
    if (_diningDateTime != null && _diningTime != null) {
      // Create a new DateTime object with the selected date and the hour from _diningTime
      DateTime newDateTime = DateTime(
        _diningDateTime!.year,
        _diningDateTime!.month,
        _diningDateTime!.day,
        _diningTime!.hour,
        _diningTime!.minute,
      );
      setState(() {
        _diningDateTime = newDateTime;
      });
    } else {
      setState(() {
        _diningDateTime = _diningDateTime;
      });
    }
  }

  String _errorMessage = "";
  Future<void> _submitReward() async {
    _formKey.currentState?.validate();

    if (_idController!.text.isEmpty ||
        _ccNomberController!.text.isEmpty ||
        _merchantNumberController!.text.isEmpty ||
        _diningAmountController!.text.isEmpty ||
        _diningDateTime == null) {
      // Show an error message or handle the case when fields are not filled
      setState(() {
        _errorMessage = "Something wrong. You have to check your network or informations...";
      });
      return;
    }
  
    // Create a ModelDining object with the values from the controllers
    ModelDining diningRequest = ModelDining(
      id: int.parse(_idController!.text),
      creditCardNumber: _ccNomberController!.text,
      merchantNumber: int.parse(_merchantNumberController!.text),
      diningAmount: double.parse(_diningAmountController!.text),
      diningDate: DateFormat('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'').format(_diningDateTime!),
      executionChain: "",
    );
  
    // Call the createReward method from the RewardController
    ModelConfirmation? confirmation = await RewardController.INSTANCE.createReward(request: diningRequest);
    // Handle the result of the createReward call
    if (confirmation != null) {
      // Successfully created the reward, navigate away or show success message
      String ccNumber = confirmation.rewardConfirmation.toString();
      Get.back();
      Get.bottomSheet(ResultUI(
        title: "Congragulations!",
        message: "Your reward is added successfuly \n"
          "Confirmation number : $ccNumber",
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
                Text("Create reward",
                  style: TextConfig.getSimpleTextStyle(true),
                ),
                Text(_errorMessage,
                  style: TextConfig.getSimpleTextStyle(true, size: 10, color: Colors.red),
                ),
                const SizedBox(height: 20),
                TextFieldEditWidgetV2(
                  controller: _idController!,
                  hint: "Id",
                  withRadius: true,
                  withEraser: false,
                  withTitleWhenTexting: false,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFieldEditWidgetV2(
                  controller: _ccNomberController!,
                  hint: "Credit Card Number",
                  withRadius: true,
                  withEraser: false,
                  withTitleWhenTexting: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFieldEditWidgetV2(
                  controller: _merchantNumberController!,
                  hint: "Merchant Number",
                  withRadius: true,
                  withEraser: false,
                  withTitleWhenTexting: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFieldEditWidgetV2(
                  controller: _diningAmountController!,
                  hint: "Dining Amount",
                  withRadius: true,
                  withEraser: false,
                  withTitleWhenTexting: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async => _handleDateTime(),
                  child: Row(
                    children: [
                      Text("Dining date",
                        style: TextConfig.getSimpleTextStyle(true),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              _diningDateTime!= null ? 
                                ConvertTimestamp.toDate(_diningDateTime!.millisecondsSinceEpoch.toString())
                                : "--:--:----",
                              style: TextConfig.getSimpleTextStyle(false, size: 10),
                            ),
                            Text(
                              _diningDateTime!= null ? 
                                ConvertTimestamp.toTime(_diningDateTime!.millisecondsSinceEpoch.toString())
                                : "--:--:----",
                              style: TextConfig.getSimpleTextStyle(false, size: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  onTap: () async => _submitReward(),
                  text: "Submit",
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