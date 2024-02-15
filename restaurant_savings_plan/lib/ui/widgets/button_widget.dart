// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/config/text_config.dart';


class ButtonWidget extends StatelessWidget {
  String text;
  Widget? icon;
  Color? background;
  Color? textColor;
  Color? borderColor;
  Function? onTap;
  Gradient? gradient;
  bool isTextExpanded;
  bool withRadius;

  ButtonWidget({
    Key? key,
    required this.text,
    this.icon,
    this.background,
    this.borderColor,
    this.textColor,
    this.onTap,
    this.gradient,
    this.isTextExpanded = false,
    this.withRadius = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 20, vertical: icon != null ? 10 : 5),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(withRadius ? 4 : 0),
          border: borderColor != null ? Border(
            top: BorderSide(width: 1.0, color: borderColor!),
            left: BorderSide(width: 1.0, color: borderColor!),
            right: BorderSide(width: 1.0, color: borderColor!),
            bottom: BorderSide(width: 1.0, color: borderColor!),
          ) : null,
          gradient: gradient,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                // overflow: isTextExpanded ? TextOverflow.clip : TextOverflow.ellipsis,
                style: TextConfig.getSimpleTextStyle(true,
                    color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
