import 'package:english_card/values/app_assets.dart';
import 'package:flutter/material.dart';

import '../models/english_today.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';

class AllWordsPage extends StatelessWidget {
  final List<EnglishToday> words;

  const AllWordsPage({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondColor,
        elevation: 0,
        title: Text(
          'English today',
          style: AppStyles.h3.copyWith(color: AppColor.textColor, fontSize: 36),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: (index % 2) == 0
                    ? AppColor.primaryColor
                    : AppColor.secondColor,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  words[index].noun!,
                  style: (index % 2 == 0)
                      ? AppStyles.h4
                      : AppStyles.h4.copyWith(color: AppColor.textColor),
                ),
                subtitle: Text(words[index].quote ??
                    '"Think of all the beauty still left around you and be happy."'),
                leading: Icon(
                  Icons.favorite,
                  color: words[index].isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            );
          }),
    );
  }
}
