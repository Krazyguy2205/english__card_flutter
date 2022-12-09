import 'package:english_card/pages/home_page.dart';
import 'package:english_card/values/app_assets.dart';
import 'package:english_card/values/app_colors.dart';
import 'package:english_card/values/app_styles.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome to',
                  style: AppStyles.h3,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'English',
                    style: AppStyles.h2.copyWith(
                      color: AppColor.blackGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      'Quotes"',
                      textAlign: TextAlign.right,
                      style: AppStyles.h4.copyWith(height: 0.5),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 72),
                child: RawMaterialButton(
                  shape: const CircleBorder(),
                  fillColor: AppColor.lightBlue,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                        (route) => false);
                  },
                  child: Image.asset(
                    AppAssets.rightArrow,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
