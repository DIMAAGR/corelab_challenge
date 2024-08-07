import 'package:corelab_challenge/modules/search/domain/entities/search_product_entity.dart';

class SearchProductModel {
  final String? condiction;
  final String? imageURL;
  final String? title;

  final double? discount;
  final double? price;

  const SearchProductModel({
    this.condiction,
    this.discount,
    this.imageURL,
    this.price,
    this.title,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) => SearchProductModel(
        title: json['title'],
        condiction: json['condiction'],
        imageURL: json['image_url'],
        discount: double.tryParse(json['discount']),
        price: double.tryParse(json['price']),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'condiction': condiction,
        'discount': discount,
        'image_url': imageURL,
        'price': price,
      };

  SearchProductEntity toEntity() => SearchProductEntity(
        condiction: ProductCondiction.fromString(condiction ?? ''),
        discount: discount,
        price: price,
        title: title,
        imageURL: imageURL,
      );
}
