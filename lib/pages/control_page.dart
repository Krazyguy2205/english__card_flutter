import 'dart:io';

import 'package:english_card/values/app_assets.dart';
import 'package:english_card/values/app_styles.dart';
import 'package:english_card/values/share_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../values/app_colors.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double sliderValue = 5;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initDefaultValue();
  }

  initDefaultValue() async {
    prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(ShareKeys.counter) ?? 5;
    setState(() {
      sliderValue = value.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondColor,
        elevation: 0,
        title: Text(
          'Your Control',
          style: AppStyles.h3.copyWith(color: AppColor.textColor, fontSize: 36),
        ),
        leading: InkWell(
          onTap: () async {
            await prefs.setInt(ShareKeys.counter, sliderValue.toInt());
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            Text(
              'How much number word at once?',
              style: AppStyles.h4
                  .copyWith(color: AppColor.lightGrey, fontSize: 19),
            ),
            const Spacer(),
            Text(
              '${sliderValue.toInt()}',
              style: AppStyles.h1.copyWith(
                  color: AppColor.primaryColor,
                  fontSize: 150,
                  fontWeight: FontWeight.bold),
            ),
            Slider(
                value: sliderValue,
                min: 5,
                max: 100,
                divisions: 100,
                activeColor: AppColor.primaryColor,
                inactiveColor: AppColor.primaryColor,
                onChanged: (value) {
                  stdout.write(value);
                  setState(() {
                    sliderValue = value;
                  });
                }),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Slide to set',
                style: AppStyles.h5.copyWith(color: AppColor.textColor, fontSize: 26),
              ),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
