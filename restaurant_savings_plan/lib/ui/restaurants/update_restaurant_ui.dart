import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/restaurant_controller.dart';
import '../../models/model_restaurant.dart';
import '../../utilities/config/text_config.dart';
import '../result_ui.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_edit_widget_v2.dart';

class UpdateRestaurantUI extends StatefulWidget {
  final ModelRestaurant? restaurant;
  const UpdateRestaurantUI({ Key? key, this.restaurant }) : super(key: key);

  @override
  State<UpdateRestaurantUI> createState() => _UpdateRestaurantUIState();
}

class _UpdateRestaurantUIState extends State<UpdateRestaurantUI> {

  final _formKey = GlobalKey<FormState>();

  bool _suspended = false;
  bool _benefitAvailabilityPolicy = false;
  TextEditingController? _idController;
  TextEditingController? _nameController;
  TextEditingController? _merchantNumberController;
  TextEditingController? _percentageAmountController;

  @override
  void initState() {
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _merchantNumberController = TextEditingController();
    _percentageAmountController = TextEditingController();

    _initDatas();

    super.initState();
  }

  @override
  void dispose() {
    _idController?.dispose();
    _nameController?.dispose();
    _merchantNumberController?.dispose();
    _percentageAmountController?.dispose();
    super.dispose();
  }

  void _initDatas() {
    if(widget.restaurant != null) {
      _idController?.text = widget.restaurant!.id.toString();
      _nameController?.text = widget.restaurant!.name!;
      _merchantNumberController?.text = widget.restaurant!.merchantNumber.toString();
      _percentageAmountController?.text = widget.restaurant!.benefitPercentage.toString();
      _suspended = widget.restaurant!.suspended;
      _benefitAvailabilityPolicy = 
        (widget.restaurant!.benefitAvailabilityPolicy != null &&
          widget.restaurant!.benefitAvailabilityPolicy == ModelRestaurant.availabilityPolicyAllowed)
          ? true : false; 
    }
  }

  String _errorMessage = "";
  Future<void> _submit() async {
    _formKey.currentState?.validate();

    if (_idController!.text.isEmpty ||
        _nameController!.text.isEmpty ||
        _merchantNumberController!.text.isEmpty ||
        _percentageAmountController!.text.isEmpty
    ) {
      // Show an error message or handle the case when fields are not filled
      setState(() {
        _errorMessage = "Something wrong. You have to check your network or informations...";
      });
      return;
    }
  
    // Create a ModelDining object with the values from the controllers
    ModelRestaurant restaurantRequest = ModelRestaurant(
      id: int.parse(_idController!.text),
      name: _nameController!.text,
      merchantNumber: int.parse(_merchantNumberController!.text),
      benefitPercentage: double.parse(_percentageAmountController!.text),
      suspended: _suspended,
      benefitAvailabilityPolicy: _benefitAvailabilityPolicy ? 
        ModelRestaurant.availabilityPolicyAllowed : ModelRestaurant.availabilityPolicyNotAllowed,
    );

    bool isSucced_ = false;
    String successMessage_ = "";
    if(widget.restaurant != null) {
      // Call the updateRestaurant method from the RestaurantController
      ModelRestaurant? confirmationUpdated = await RestaurantController.INSTANCE.updateRestaurant(
        id: restaurantRequest.id!,
        updatedRestaurant: restaurantRequest
      );

      if(confirmationUpdated !=  null) {
        isSucced_ = true;
        successMessage_ = "Your restaurant is updated successfuly";
      }
    } else {
      // Call the createRestaurant method from the RestaurantController
      String? confirmation = await RestaurantController.INSTANCE.createRestaurant(request: restaurantRequest);
      if(confirmation !=  null) {
        isSucced_ = true;
        successMessage_ = "Your restaurant is added successfuly";
      }
    }
    // Handle the result of the createReward call
    if (isSucced_) {
      // Successfully created the reward, navigate away or show success message
      Get.back();
      Get.bottomSheet(ResultUI(
        title: "Congragulations!",
        message: successMessage_,
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
    bool isUpdateOption_ = widget.restaurant != null;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isUpdateOption_ ? "Update restaurant": "Create restaurant",
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
                  controller: _nameController!,
                  hint: "Name",
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
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFieldEditWidgetV2(
                  controller: _percentageAmountController!,
                  hint: "Benefit percentage",
                  withRadius: true,
                  withEraser: false,
                  withTitleWhenTexting: false,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text("To Suspend", 
                        style: TextConfig.getSimpleTextStyle(true),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Checkbox(
                      value: _benefitAvailabilityPolicy, 
                      onChanged: (value) {
                        setState(() {
                          _benefitAvailabilityPolicy = value!;
                        });
                      }
                    ),
                  ],
                ),
                /*
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text("To suspend", 
                        style: TextConfig.getSimpleTextStyle(true),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Checkbox(
                      value: _suspended, 
                      onChanged: (value) {
                        setState(() {
                          _suspended = value!;
                        });
                      }
                    ),
                  ],
                ),
                */
                const SizedBox(height: 20),
                ButtonWidget(
                  onTap: () async => _submit(),
                  text: "Confirm",
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