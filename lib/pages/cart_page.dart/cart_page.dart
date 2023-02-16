import 'package:flutter/material.dart';
import '../../model/cart.dart';
import '../../pages/cart_page.dart/cart_item_tile.dart';
import '../../pages/cart_page.dart/cart_page_bottom_bar.dart';
import '../../pages/main_page/product_tile.dart';
import '../../providers/cart_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  List<Widget> _buildCartItem(List<ShopItem> cartItems) {
    final list = <Widget>[];
    for (var i = 0; i < cartItems.length; i++) {
      if (i != cartItems.length - 1) {
        list.add(ShopItemTile(key: ValueKey(i), item: cartItems[i]));
        list.add(Divider(color: Colors.grey.shade300, thickness: 2.0));
      } else {
        list.add(ShopItemTile(key: ValueKey(i), item: cartItems[i]));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider).items;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('Cart'),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300)),
                child: const Icon(Icons.arrow_back))),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300)),
                child: const Icon(Icons.more_horiz)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width * ((1 - (1 / 1.1)) / 2)),
            child: SingleChildScrollView(
              child: Column(
                children: _buildCartItem(cartItems),
              ),
            ),
          )),
          Divider(
            thickness: 4,
            color: Colors.grey.shade300,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      ((1 - (1 / 1.1)) / 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.008),
                    child: Text(
                      "Product Related",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                      child: ListView.builder(
                          clipBehavior: Clip.none,
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: ProductTile(
                                      product: ref
                                          .watch(mockDataProvider)[2 - index]
                                          .toProduct()),
                                ),
                              ))),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
          CartPageBottomBar(itemCount: ref.watch(cartProvider).checkoutAmount),
        ],
      ),
    );
  }
}
