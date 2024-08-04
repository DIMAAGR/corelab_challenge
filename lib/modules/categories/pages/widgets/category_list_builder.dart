import 'package:corelab_challenge/modules/shared/pages/styles/colors.dart';
import 'package:corelab_challenge/modules/shared/pages/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CategoryListBuilder extends StatelessWidget {
  final List<String> categories;
  const CategoryListBuilder({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              title: Text(categories[index], style: AppTextStyle.category),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: AppColors.aliceBlue),
            ),
          ],
        );
      },
    );
  }
}
