import 'package:flutter/material.dart';

import '../../utilities/config/text_config.dart';
import '../../utilities/variables/app_texts.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.network_check_rounded, size: 100),
            const SizedBox(height: 20),
            Text(
              AppTexts.noConnection,
              style: TextConfig.getSimpleTextStyle(true, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
