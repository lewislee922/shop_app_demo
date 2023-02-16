import 'package:flutter/material.dart';
import '../../model/product.dart';
import '../../model/product_options.dart';
import '../../pages/detail_page/bottom_bar.dart';
import '../../pages/detail_page/category_options.dart';
import '../../pages/detail_page/color_options.dart';
import '../../pages/detail_page/product_image_view/product_image_view.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductDetail productDetail;
  const ProductDetailPage({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            ((1 - (1 / 1.1)) / 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.arrow_back_ios)),
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(Icons.favorite_border))
                      ],
                    )),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 8),
                          child: Center(
                            child: Text(
                              productDetail.productName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 32),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32.0),
                        ProductImageView(
                            imageSrcs: productDetail.productPicSrcs,
                            preferredHeight:
                                MediaQuery.of(context).size.height * 0.4),
                        const SizedBox(height: 16.0),
                        SelectableColorOptions(
                            options: ColorOption.sampleData()),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width *
                                  ((1 - (1 / 1.1)) / 2)),
                          child: Column(
                            children: [
                              ...productDetail.options.map((option) =>
                                  SelectableSpecOption(option: option)),
                            ],
                          ),
                        )
                      ]),
                )),
                CustomBottomBar(productDetail: productDetail)
              ],
            ),
          )
        ],
      ),
    );
  }
}
