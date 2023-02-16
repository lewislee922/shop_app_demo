import 'package:flutter/material.dart';
import '../../model/product.dart';

class ProductTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Product product;
  const ProductTile({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(4, 6),
                      blurRadius: 16.0,
                      spreadRadius: 0.0,
                      color: Colors.grey.shade200.withOpacity(0.4))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        product.mainProductPicSrc,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Center(
                      child: Text(
                        product.productName,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (product.hasDiscount != null)
                      product.hasDiscount!
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: RichText(
                                  text: TextSpan(
                                      text: "\$${product.discountPrice!}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 48, 93, 188)),
                                      children: [
                                    TextSpan(
                                        text: "\$${product.price}",
                                        style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontSize: 12.0,
                                            decoration:
                                                TextDecoration.lineThrough))
                                  ])),
                            )
                          : Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 48, 93, 188),
                              ),
                            ),
                    if (product.hasDiscount == null)
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 48, 93, 188),
                        ),
                      ),
                    const SizedBox(height: 4.0)
                  ]),
            ),
          ),
          if (product.hasDiscount == null && product.isNew)
            Align(
              alignment: Alignment.bottomCenter - const Alignment(0, -0.10),
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  'NEW ARRIVAL',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          if (product.hasDiscount != null)
            Align(
              alignment: Alignment.bottomCenter - const Alignment(0, -0.10),
              child: Builder(builder: (context) {
                String notifiedString = '';
                if (product.hasDiscount!) {
                  final percentage =
                      ((product.discountPrice! / product.price) * 100).round();
                  notifiedString = '$percentage% OFF';
                }
                if (product.isNew && notifiedString != '') {
                  notifiedString = "NEW - $notifiedString";
                }
                return Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    notifiedString,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }),
            ),
        ],
      ),
    );
  }
}
