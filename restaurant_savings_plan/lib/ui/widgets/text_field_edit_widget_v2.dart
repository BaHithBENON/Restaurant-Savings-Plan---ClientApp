// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/config/color_config.dart';
import '../../utilities/config/text_config.dart';
import '../../utilities/variables/app_texts.dart';


class TextFieldEditWidgetV2 extends StatefulWidget {

  String? title;
  String? hint;
  TextEditingController controller;
  TextInputType? keyboardType;
  int? minLines;
  int? maxLines;
  bool bold;
  Color? borderColor;
  Color? blocColor;
  Function? onChange;
  Function? onSave;
  Function? validator;
  String? obscureCharacter;
  bool? obscure;
  String? errorText;
  String? indicationText;
  bool tagError;
  Widget? leftIcon;
  bool withEraser;
  bool readOnly;
  bool withTitleWhenTexting;
  TextInputAction? textInputAction;
  Color? inputColor;
  bool withRadius;

  TextFieldEditWidgetV2({
    super.key,
    this.title,
    this.hint,
    required this.controller,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines = 1,
    this.bold = false,
    this.borderColor,
    this.onChange,
    this.onSave,
    this.validator,
    this.obscureCharacter = '•',
    this.obscure = false,
    this.errorText,
    this.indicationText,
    this.tagError = false,
    this.leftIcon,
    this.withEraser = true,
    this.readOnly = false,
    this.withTitleWhenTexting = true,
    this.textInputAction,
    this.blocColor,
    this.inputColor,
    this.withRadius = false,
  });

  @override
  State<TextFieldEditWidgetV2> createState() => _TextFieldEditWidgetV2State();
}

class _TextFieldEditWidgetV2State extends State<TextFieldEditWidgetV2> {
  bool _isTexting = false;
  bool _hidden = false;
  final FocusNode _focusNode = FocusNode(
    canRequestFocus: false,
    descendantsAreFocusable: false,
  );

  @override
  void initState() {
    super.initState();
    _hidden = widget.obscure!;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _isTexting = true;
        });
      } else {
        setState(() {
          _isTexting = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null && widget.title!.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(
            widget.title!,
            style:
                TextConfig.getSimpleTextStyle(true),
          ),
          const SizedBox(height: 10),
        ],
        if (_isTexting &&
            widget.hint != null &&
            widget.hint!.isNotEmpty &&
            widget.withTitleWhenTexting) ...[
          Text(
            widget.hint!,
            style:
                TextConfig.getSimpleTextStyle(true),
          ),
          const SizedBox(height: 10),
        ],
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(widget.leftIcon != null)
            ...[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: widget.blocColor ??ColorConfig.secondaryColor,
                  borderRadius: widget.withRadius ? BorderRadius.circular(4) : null,
                ),
                child: widget.leftIcon,
              ),
              const SizedBox(width: 5),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.withRadius ? 4 : 0),
                      color: widget.inputColor ?? ColorConfig.getInputColor(context),
                      // border: Border(
                      //   top: BorderSide(
                      //       width: 1.0,
                      //       color: _isTexting && widget.borderColor != null
                      //           ? widget.borderColor!
                      //           : Colors.black),
                      //   left: BorderSide(
                      //       width: 1.0,
                      //       color: _isTexting && widget.borderColor != null
                      //           ? widget.borderColor!
                      //           : Colors.black),
                      //   right: BorderSide(
                      //       width: 1.0,
                      //       color: _isTexting && widget.borderColor != null
                      //           ? widget.borderColor!
                      //           : Colors.black),
                      //   bottom: BorderSide(
                      //       width: 1.0,
                      //       color: _isTexting && widget.borderColor != null
                      //           ? widget.borderColor!
                      //           : Colors.black),
                      // ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          TextFormField(
                            controller: widget.controller,
                            keyboardType: widget.keyboardType ?? TextInputType.text,
                            style: TextConfig.getSimpleTextStyle(false),
                            textInputAction: widget.textInputAction,
                            minLines: widget.minLines,
                            maxLines: widget.maxLines,
                            readOnly: widget.readOnly,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: widget.hint,
                              hintStyle: TextConfig.getSimpleTextStyle(
                                //widget.bold,
                                false,
                                //font: FontsNames.fontGlint,
                                color: Colors.grey[500],
                              ),
                            ),
                            focusNode: _focusNode,
                            obscureText: _hidden,
                            onTap: () {},
                            onChanged: (value) {
                              if (widget.onChange != null) widget.onChange!(value);
                            },
                            // onSubmitted: (value) {
                            //   if (widget.validator != null) {
                            //     widget.validator!(value);
                            //   }
                            // },
                            validator: (value) {
                              if (widget.validator != null) {
                                return widget.validator!(value);
                              } else {
                                return null;
                              }
                            },
                            onEditingComplete: () {
                              _focusNode.unfocus();
                              if (widget.onSave != null) widget.onSave!();
                            },
                          ),
                      ],
                    ),
                  ),
                  if (widget.indicationText != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      widget.indicationText!,
                      style: TextConfig.getSimpleTextStyle(true, size: 10),
                    ),
                  ],
                  if (widget.tagError && widget.errorText != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      widget.errorText!,
                      style: TextConfig.getSimpleTextStyle(true, size: 10, color: Colors.red),
                    ),
                  ]
                ],
              ),
            ),
            if((widget.withEraser && _focusNode.hasFocus))
              if(!widget.obscure!)
                InkWell(
                  onTap: () {
                    widget.controller.clear();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: widget.withRadius ? BorderRadius.circular(4) : null,
                    ),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                )
              else
                InkWell(
                  onTap: () {
                    setState(() {
                      _hidden = !_hidden;
                    });
                  },
                  child: Text(
                    _hidden
                        ? AppTexts.toSee
                        : AppTexts.toHide,
                  ),
                ),
          ],
        ),
      ],
    );
  }
}
