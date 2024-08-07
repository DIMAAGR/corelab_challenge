// I'm not a fan of using Equatable within the domain as it shouldn't rely on external packages.
// Therefore, since this is a simpler project, I won't be using it.

enum ProductCondiction {
  newer('novo'),
  old('usado');

  // ignore: prefer_typing_uninitialized_variables
  final _condiction;

  const ProductCondiction(this._condiction);

  static ProductCondiction fromString(String condiction) {
    return condiction == 'new' ? ProductCondiction.newer : ProductCondiction.old;
  }

  @override
  String toString() => _condiction;
}

class SearchProductEntity {
  final ProductCondiction? condiction;
  final String? imageURL;
  final String? title;

  final double? discount;
  final double? price;

  const SearchProductEntity({
    this.condiction,
    this.discount,
    this.imageURL,
    this.price,
    this.title,
  });
}
