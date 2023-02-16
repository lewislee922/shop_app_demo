import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_tile.dart';
import '../../providers/cart_provider.dart';
import '../detail_page/product_detail.dart';

class ProductGridView extends ConsumerWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView(
      padding: const EdgeInsets.only(bottom: 32.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 8.0,
          mainAxisExtent: MediaQuery.of(context).size.height / 3),
      children: List.generate(
        10,
        (index) => ProductTile(
            onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => ProductDetailPage(
                    productDetail: ref.watch(mockDataProvider)[index % 3]))),
            product: ref.watch(mockDataProvider)[index % 3].toProduct()),
      ),
    );
  }
}
