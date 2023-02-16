import 'package:flutter/material.dart';

class CartPageBottomBar extends StatelessWidget {
  final int itemCount;
  const CartPageBottomBar({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
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
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 48, 60, 80),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Checkout',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                AnimatedCrossFade(
                  alignment: Alignment.center,
                  crossFadeState: itemCount != 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400),
                  firstChild: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Text(
                        '$itemCount',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 48, 60, 80)),
                      )),
                  secondChild: const SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
