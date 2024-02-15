import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/contribution_controller.dart';
import '../../models/model_account.dart';
import '../../models/model_account_contribution_request.dart';
import '../../models/model_account_contribution_response.dart';
import '../../utilities/config/text_config.dart';
import '../result_ui.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_edit_widget_v2.dart';

class UpdateAccountUI extends StatefulWidget {
  final ModelAccount? account;
  const UpdateAccountUI({ Key? key, this.account }) : super(key: key);

  @override
  State<UpdateAccountUI> createState() => _UpdateAccountUIState();
}

class _UpdateAccountUIState extends State<UpdateAccountUI> {
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

    // Call the updateAccount method from the AccountController
    ModelAccountContributionResponse? response = await ContributionController.INSTANCE.createAccount(request: accountRequest);

    // Handle the result of the updateAccount call
    if (response != null) {
      // Successfully updated the account, navigate away or show success message
      Get.back();
      Get.bottomSheet(const ResultUI(
        title: "Success!",
        message: "Your account has been creataed successfully.",
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal:  20, vertical:  10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create Account",
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
                    controller: _ccnumberController!,
                    hint: "Credit Card Number",
                    withRadius: true,
                    withEraser: false,
                    withTitleWhenTexting: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height:   10),
                  TextFieldEditWidgetV2(
                    controller: _anumberController!,
                    hint: "Account Number",
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
                  // ... other widgets
                ],
                const SizedBox(height: 20),
                ButtonWidget(
                  onTap: () async => _submit(),
                  text: "Create",
                  background: Colors.deepPurple,
                  textColor: Colors.white,
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