import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/contribution_controller.dart';
import '../../models/model_account.dart';
import '../../models/model_account_contribution_request.dart';
import '../../models/model_account_contribution_response.dart';
import '../../models/model_beneficiary.dart';
import '../../models/model_credit_card.dart';
import '../../utilities/config/text_config.dart';
import '../result_ui.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_edit_widget_v2.dart';

class UpdateBeneficiaryUI extends StatefulWidget {
  final ModelAccount account;
  final ModelBeneficiary? beneficiary;
  final ModelCreditCard? creditCard;
  const UpdateBeneficiaryUI({ Key? key, required this.account, this.beneficiary, this.creditCard }) : super(key: key);

  @override
  State<UpdateBeneficiaryUI> createState() => _UpdateBeneficiaryUIState();
}

class _UpdateBeneficiaryUIState extends State<UpdateBeneficiaryUI> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _idController;
  TextEditingController? _nameController;
  TextEditingController? _ccnumberController;
  TextEditingController? _anumberController;
  TextEditingController? _percentageController;

  @override
  void initState() {
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _ccnumberController = TextEditingController();
    _anumberController = TextEditingController();
    _percentageController = TextEditingController();

    _initDatas();
    super.initState();
  }

  @override
  void dispose() {
    _idController?.dispose();
    _nameController?.dispose();
    _ccnumberController?.dispose();
    _anumberController?.dispose();
    _percentageController?.dispose();
    super.dispose();
  }

    void _initDatas() {
    if(widget.beneficiary != null && widget.creditCard != null) {
      _idController?.text = widget.beneficiary!.id.toString();
      _nameController?.text = widget.beneficiary!.name!;
      _ccnumberController?.text = widget.creditCard!.number!.toString();
      _percentageController?.text = widget.beneficiary!.percentage!.toString();
    }

    if(widget.account.creditCard != null) {
      _ccnumberController?.text = widget.account.creditCard!.number!.toString();
    }

    _anumberController?.text = widget.account.number.toString();
  }

  String _errorMessage = "";
  Future<void> _submit() async {
    _formKey.currentState?.validate();

    if (_anumberController!.text.isEmpty ||
        _nameController!.text.isEmpty ||
        _ccnumberController!.text.isEmpty ||
        _percentageController!.text.isEmpty
    ) {
      // Show an error message or handle the case when fields are not filled
      setState(() {
        _errorMessage = "All fields are required.";
      });
      return;
    }

    // Create a ModelAccountContributionRequest object with the values from the controllers
    ModelAccountContributionRequest accountRequest = ModelAccountContributionRequest(
      name: _nameController!.text,
      anumber: _anumberController!.text,
      ccnumber: _ccnumberController!.text,
      percentage:double.parse( _percentageController!.text),
    );

    bool isSucced_ = false;
    String successMessage_ = "";
    if(widget.beneficiary != null && widget.creditCard != null) {
      // Call the updateAccount method from the AccountController
      ModelAccountContributionResponse? response = await ContributionController.INSTANCE.updateBeneficiary(
        request: accountRequest, 
        id: widget.beneficiary!.id!
      );

      if(response !=  null) {
        isSucced_ = true;
        successMessage_ = "Your beneficiary is updated successfuly";
      }
    } else {
      // Call the updateAccount method from the AccountController
      ModelAccountContributionResponse? response = await ContributionController.INSTANCE.createBeneficiary(
        request: accountRequest,
        accountNumber: widget.account.number!
      );

      if(response !=  null) {
        isSucced_ = true;
        successMessage_ = "Your beneficiary is added successfuly";
      }
    }

    // Handle the result of the updateAccount call
    if (isSucced_) {
      // Successfully updated the account, navigate away or show success message
      Get.back();
      Get.bottomSheet(ResultUI(
        title: "Success!",
        message: successMessage_,
      ));
    } else {
      // Failed to update the account, show an error message
      setState(() {
        _errorMessage = "Failed to create your account. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isUpdateOption = widget.beneficiary != null && widget.creditCard != null;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal:  20, vertical:  10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isUpdateOption ? "Update Beneficiary" : "Create Beneficiary",
                  style: TextConfig.getSimpleTextStyle(true),
                ),
                Text(_errorMessage,
                  style: TextConfig.getSimpleTextStyle(true, size:  10, color: Colors.red),
                ),
                const SizedBox(height: 20),
                ...[
                  TextFieldEditWidgetV2(
                    controller: _nameController!,
                    hint: "Name",
                    withRadius: true,
                    withEraser: false,
                    withTitleWhenTexting: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height:   10),
                  TextFieldEditWidgetV2(
                    controller: _percentageController!,
                    hint: "Allocation Percentage",
                    withRadius: true,
                    withEraser: false,
                    withTitleWhenTexting: false,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height:   10),
                  TextFieldEditWidgetV2(
                    controller: _ccnumberController!,
                    hint: "Credit Card Number",
                    title: "Credit Card Number",
                    withRadius: true,
                    withEraser: false,
                    readOnly: true,
                    withTitleWhenTexting: false,
                    keyboardType: TextInputType.text,
                    inputColor: Theme.of(context).canvasColor.withOpacity(.2),
                  ),
                  const SizedBox(height:   10),
                  TextFieldEditWidgetV2(
                    controller: _anumberController!,
                    hint: "Account Number",
                    title: "Account Number",
                    withRadius: true,
                    withEraser: false,
                    readOnly: true,
                    withTitleWhenTexting: false,
                    keyboardType: TextInputType.text,
                    inputColor: Theme.of(context).canvasColor.withOpacity(.2),
                  ),
                  // ... other widgets
                ],
                const SizedBox(height: 20),
                ButtonWidget(
                  onTap: () async => _submit(),
                  text: isUpdateOption ? "Update" : "Create",
                  background: Colors.deepPurple,
                  withRadius: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}