import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/cart.dart';
import '../../model/product.dart';
import '../../providers/cart_provider.dart';

class CustomBottomBar extends ConsumerWidget {
  final ProductDetail productDetail;
  const CustomBottomBar({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal:
              MediaQuery.of(context).size.width * ((1 - (1 / 1.1)) / 2)),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, -3),
                color: Colors.grey.shade300.withOpacity(0.6))
          ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey.shade300, width: 1.0),
                    shape: const CircleBorder()),
                onPressed: () {
                  if (ref
                      .read(cartProvider)
                      .items
                      .where(
                          (element) => element.product.id == productDetail.id)
                      .isEmpty) {
                    ref.read(cartProvider).addItem(ShopItem(productDetail));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.shopping_bag_outlined, size: 32),
                )),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 48, 60, 80),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                'Checkout   \$${productDetail.discountPrice ?? productDetail.price}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
