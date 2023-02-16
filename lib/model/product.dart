import '../../model/product_options.dart';

class Product {
  final String id;
  final String productName;
  final String mainProductPicSrc;
  final double price;
  final bool? hasDiscount;
  final double? discountPrice;
  final bool isNew;

  Product(this.id, this.productName, this.mainProductPicSrc, this.price,
      this.hasDiscount, this.discountPrice, this.isNew);

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        productName = json['productName'],
        mainProductPicSrc = json['pic'],
        price = json['price'],
        hasDiscount = json['discount'],
        discountPrice = json['discountPrice'],
        isNew = json['new'];

  static sampleData() => Product(
      '1',
      'OnePlus 11 5G + \$100 Amazon Gift Card Bundle ',
      'https://m.media-amazon.com/images/I/51dyMimGODL._AC_SX679_.jpg',
      799.99,
      true,
      699.99,
      false);
}

class ProductDetail {
  final String id;
  final String productName;
  final List<String> productPicSrcs;
  final List<SpecOption> options;
  final double price;
  final bool? hasDiscount;
  final double? discountPrice;
  final bool isNew;

  ProductDetail(this.id, this.productName, this.productPicSrcs, this.options,
      this.price, this.hasDiscount, this.discountPrice, this.isNew)
      : assert((hasDiscount != null && discountPrice != null) ||
            (hasDiscount == null && discountPrice == null));

  Product toProduct() => Product(id, productName, productPicSrcs.first, price,
      hasDiscount, discountPrice, isNew);

  ProductDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        price = json['price'],
        hasDiscount = json['hasDiscount'],
        discountPrice = json['discountPrice'],
        isNew = json['isNew'],
        productName = json['productName'],
        productPicSrcs = List<String>.from(json['pics']),
        options = List<Map<String, dynamic>>.from(json['specOptions'])
            .map((e) => SpecOption.fromJson(e))
            .toList();

  static ProductDetail sampleData() => ProductDetail(
      '1',
      'OnePlus 11 5G + \$100 Amazon Gift Card Bundle ',
      [
        'https://www.giztop.com/media/catalog/product/cache/dc206057cdd42d7e34b9d36e347785ca/o/n/oneplus_11.png',
        'https://fdn.gsmarena.com/imgroot/news/23/01/oneplus-11-ofic/inline/-1200/gsmarena_001.jpg',
        'https://images.indianexpress.com/2023/01/oneplus-11-cloud-11-featured.jpg',
        'https://www.techritual.com/wp-content/uploads/2023/01/1672047621_OnePlus-11.jpg',
        'https://www.qucox.com/wp-content/uploads/2023/01/OnePlus-11-1.jpg'
      ],
      SpecOption.sampleData(),
      799.99,
      true,
      699.99,
      false);
}
