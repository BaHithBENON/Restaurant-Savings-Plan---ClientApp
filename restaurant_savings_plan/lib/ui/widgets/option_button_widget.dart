// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/config/color_config.dart';
import '../../utilities/config/text_config.dart';

class OptionButtonWidget extends StatelessWidget {
  Widget? leftIcon;
  Widget? rightIcon;
  Color? iconBoxColor;
  String text;
  Function? onTap;
  Color? backgroundColor;
  final bool withRadius;

  OptionButtonWidget({
    Key? key, 
    this.leftIcon, 
    this.rightIcon, 
    required this.text, 
    this.onTap, 
    this.backgroundColor,
    this.iconBoxColor,
    this.withRadius = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leftIcon != null) ...[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconBoxColor ?? Colors.black,
                borderRadius: withRadius ? BorderRadius.circular(4) : null,
              ),
              child: leftIcon,
            ),
            const SizedBox(width: 5),
          ],
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular( withRadius ? 4 : 0),
                color: backgroundColor ?? ColorConfig.getInputColor(context),
              ),
              child: Text(
                text,
                style: TextConfig.getSimpleTextStyle(true),
              ),
            ),
          ),
          if (rightIcon != null) ...[
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBoxColor ?? Colors.black,
                borderRadius: withRadius ? BorderRadius.circular(4) : null,
              ),
              child: rightIcon,
            ),
            const SizedBox(width: 5),
          ],
        ],
      ),
    );
  }
}
