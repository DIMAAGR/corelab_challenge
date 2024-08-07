import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

class SearchHistoric extends StatelessWidget {
  final List<String> searches;
  final double height;
  final Function(String value) onPressed;
  const SearchHistoric({
    super.key,
    required this.searches,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  height - (MediaQuery.of(context).viewInsets.bottom - 50),
      width: MediaQuery.of(context).size.width,
      color: AppColors.background,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 8),
              child: Text(
                'Pesquisas recentes',
                style: AppTextStyle.recentlySearches,
              ),
            ),
            ...List.generate(
              searches.length < 15 ? searches.length : 15,
              (index) {
                return ListTile(
                  leading: const Icon(Icons.history, color: AppColors.grey),
                  onTap: () {
                    onPressed(searches[index]);
                  },
                  title: Text(
                    searches[index],
                    style: AppTextStyle.historyTileTitle,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
