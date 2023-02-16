import '../../model/cart.dart';
import 'package:flutter/material.dart';

class AmountControl extends StatelessWidget {
  final ShopItem item;
  final VoidCallback? onAdd;
  final VoidCallback? onReduce;
  const AmountControl(
      {super.key, this.onAdd, this.onReduce, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width / 10,
          width: MediaQuery.of(context).size.width / 10,
          child: IconButton(
              splashRadius: MediaQuery.of(context).size.width / 30,
              onPressed: onReduce,
              icon: const Icon(Icons.remove)),
        ),
        const SizedBox(width: 8.0),
        Text(item.shopAmount.toString()),
        const SizedBox(width: 8.0),
        SizedBox(
            height: MediaQuery.of(context).size.width / 10,
            width: MediaQuery.of(context).size.width / 10,
            child: IconButton(
                splashRadius: MediaQuery.of(context).size.width / 30,
                onPressed: onAdd,
                icon: const Icon(Icons.add)))
      ],
    );
  }
}
