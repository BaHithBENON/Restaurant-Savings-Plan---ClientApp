// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/config/text_config.dart';

class InfoTextWidget extends StatelessWidget {
  String text;
  InfoTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextConfig.getSimpleTextStyle(
          true,
          size: 30,
          color: Colors.grey[500],
        ),
      ),
    );
  }
}
