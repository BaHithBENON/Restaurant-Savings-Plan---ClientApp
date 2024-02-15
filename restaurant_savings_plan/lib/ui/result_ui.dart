import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../utilities/config/text_config.dart';

class ResultUI extends StatelessWidget {

  final String message;
  final String title;
  const ResultUI({ 
    Key? key,
    required this.message,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
              textAlign: TextAlign.center,
              style: TextConfig.getSimpleTextStyle(true),
            ),
            const SizedBox(height: 20),
            const Icon(TablerIcons.circle_check_filled, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            Text(message,
              textAlign: TextAlign.center,
              style: TextConfig.getSimpleTextStyle(true),
            ),
          ],
        ),
      ),
    );
  }
}