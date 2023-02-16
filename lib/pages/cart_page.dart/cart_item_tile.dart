import 'package:flutter/material.dart';
import '../../model/cart.dart';
import '../../providers/cart_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'amount_control.dart';

class ShopItemTile extends ConsumerWidget {
  final ShopItem item;
  const ShopItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 8,
          width: constraints.maxWidth,
          child: Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: item.isSelected,
                  onChanged: (value) => ref.read(cartProvider).select(item)),
              Image.network(item.product.productPicSrcs.first),
              const SizedBox(width: 4.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.product.productName),
                    const SizedBox(height: 8.0),
                    Text(item.product.price.toString()),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AmountControl(
                            item: item,
                            onAdd: () => ref.read(cartProvider).addAmount(item),
                            onReduce: () =>
                                ref.read(cartProvider).reduceAmount(item)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
