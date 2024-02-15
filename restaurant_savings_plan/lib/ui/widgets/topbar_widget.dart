// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/config/text_config.dart';

class TopbarWidget extends StatelessWidget {
  Widget? leftIcon;
  String? title;
  Function? onTap;
  bool iconWithBox;

  TopbarWidget({Key? key, 
    this.leftIcon, 
    this.title, 
    this.onTap,
    this.iconWithBox = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 5, left: 10, 
        bottom: 10, top: 10,
      ),
      child: Row(
        children: [
          if (leftIcon != null)...[
            if(!iconWithBox)
              InkWell(
                onTap: () {
                  if (onTap != null) onTap!();
                },
                child: leftIcon!,
              ) 
            else InkWell(
              onTap: () {
                if (onTap != null) onTap!();
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
                child: leftIcon!,
              ),
            ),
          ],
          if (title != null && title!.isNotEmpty)...[
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title!,
                style: TextConfig.getSimpleTextStyle(true),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
