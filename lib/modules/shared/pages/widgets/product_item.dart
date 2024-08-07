import 'package:corelab_challenge/modules/shared/pages/extensions/double_extension.dart';
import 'package:corelab_challenge/modules/shared/pages/styles/colors.dart';
import 'package:corelab_challenge/modules/shared/pages/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String condiction;
  final String imageURL;
  final String title;

  final double discount;
  final double price;
  const ProductItem({
    super.key,
    required this.condiction,
    required this.imageURL,
    required this.title,
    required this.discount,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 96,
                  height: 96,
                  child: Image.network(imageURL),
                ),
                const SizedBox(width: 32),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (discount != 0)
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${(discount * 100).toStringAsFixed(0)}% OFF',
                            style: AppTextStyle.percentageOFF,
                          ),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: AppTextStyle.productTitle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        price.toBRL(),
                        style: AppTextStyle.productPriceDiscounted,
                      ),
                      Text(
                        (price - (price * discount)).toBRL(),
                        style: AppTextStyle.productPrice,
                      ),
                      Text(
                        'Em até 12x de ${(price / 12).toBRL()}',
                        style: AppTextStyle.installmentValue,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        condiction.toUpperCase(),
                        style: AppTextStyle.productCondiction,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.aliceBlue, height: 0,),
        ],
      ),
    );
  }
}
