import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/calculation_controller.dart';
import '../../models/model_benefit_restaurant.dart';
import '../../models/model_restaurant.dart';
import '../../utilities/config/text_config.dart';
import '../result_ui.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_edit_widget_v2.dart';

class CalculationBenefitUI extends StatefulWidget {
  final ModelRestaurant? restaurant;
  const CalculationBenefitUI({ Key? key, this.restaurant }) : super(key: key);

  @override
  State<CalculationBenefitUI> createState() => _CalculationBenefitUIState();
}

class _CalculationBenefitUIState extends State<CalculationBenefitUI> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController? _diningAmountController;
  TextEditingController? _merchantNumberController;

  @override
  void initState() {
    _diningAmountController = TextEditingController();
    _merchantNumberController = TextEditingController();

    _initDatas();

    super.initState();
  }

  @override
  void dispose() {
    _diningAmountController?.dispose();
    _merchantNumberController?.dispose();
    super.dispose();
  }

  void _initDatas() {
    if(widget.restaurant != null) {
      _merchantNumberController?.text = widget.restaurant!.merchantNumber.toString();
    }
  }

  String _errorMessage = "";
  Future<void> _submit() async {
    _formKey.currentState?.validate();

    if (_diningAmountController!.text.isEmpty ||
        _merchantNumberController!.text.isEmpty
    ) {
      print("ghjklm");
      // Show an error message or handle the case when fields are not filled
      setState(() {
        _errorMessage = "Something wrong. You have to check your network or informations..";
      });
      return;
    }

    // Call the calculateBenefit method from the CalculationController
    ModelBenefitRestaurant? confirmationCalculation = await CalculationController.INSTANCE.calculateBenefit(
      merchantNumber: int.parse(_merchantNumberController!.text),
      diningAmount: double.parse(_diningAmountController!.text),
    );

    // Handle the result of the createReward call
    if (confirmationCalculation !=  null) {
      // Successfully created the reward, navigate away or show success message
      Get.back();
      Get.bottomSheet(ResultUI(
        title: "Benefits!",
        message: "The profit made with a purchase of ${_diningAmountController!.text} is: ${confirmationCalculation.amount!}",
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
                Text("Calculate benefit",
                  style: TextConfig.getSimpleTextStyle(true),
                ),
                Text(_errorMessage,
                  style: TextConfig.getSimpleTextStyle(true, size: 10, color: Colors.red),
                ),
                const SizedBox(height: 20),
                TextFieldEditWidgetV2(
                  controller: _merchantNumberController!,
                  hint: "Merchant Number",
                  withRadius: true,
                  withEraser: false,
                  withTitleWhenTexting: false,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFieldEditWidgetV2(
                  controller: _diningAmountController!,
                  hint: "Dining amount",
                  withRadius: true,
                  withEraser: false,
                  withTitleWhenTexting: false,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  onTap: () async => _submit(),
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