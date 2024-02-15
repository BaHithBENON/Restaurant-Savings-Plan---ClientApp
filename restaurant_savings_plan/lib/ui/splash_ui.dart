import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/config/text_config.dart';
import '../utilities/variables/app_texts.dart';

class SplashUI extends StatelessWidget {
  const SplashUI({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //
            Text(AppStrings.appName,
              textAlign: TextAlign.end,
              style: TextConfig.getSimpleTextStyle(true, size: 30),
            ),
            Text("The Frequent flyer Network",
              textAlign: TextAlign.end,
              style: TextConfig.getSimpleTextStyle(true),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.toNamed("/home");
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text("Continuer",
                  textAlign: TextAlign.end,
                  style: TextConfig.getSimpleTextStyle(true, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}