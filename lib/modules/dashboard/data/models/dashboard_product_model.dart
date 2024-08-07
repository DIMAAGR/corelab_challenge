import '../../domain/entities/dashboard_product_entity.dart';

class DashboardProductModel {
  final String? condiction;
  final String? imageURL;
  final String? title;

  final double? discount;
  final double? price;

  final DateTime? createdAt;

  const DashboardProductModel({
    this.condiction,
    this.createdAt,
    this.discount,
    this.imageURL,
    this.price,
    this.title,
  });

  factory DashboardProductModel.fromJson(Map<String, dynamic> json) {


    return DashboardProductModel(
      title: json['title'],
      condiction: json['condiction'],
      imageURL: json['image_url'],
      discount: double.tryParse(json['discount']),
      price: double.tryParse(json['price']),
      createdAt: DateTime.tryParse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'condiction': condiction,
        'discount': discount,
        'image_url': imageURL,
        'price': price,
        'created_at': createdAt,
      };

  DashboardProductEntity toEntity() => DashboardProductEntity(
        condiction: ProductCondiction.fromString(condiction ?? ''),
        discount: discount,
        price: price,
        title: title,
        imageURL: imageURL,
        createdAt: createdAt,
      );
}
