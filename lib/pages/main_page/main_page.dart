import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_bar/app_bar.dart';
import 'stacked_listview.dart';
import '../cart_page.dart/cart_page.dart';
import 'category_list_view.dart';
import 'product_grid_view.dart';

const icons = [
  Icons.shopping_bag_outlined,
  Icons.favorite_outline,
  Icons.notifications_none
];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientAppBar(
              avatar: const AssetImage('assets/avatars/images.jpeg'),
              title: "Find best device for your setup!",
              preferredHeight: MediaQuery.of(context).size.height / 3.2,
              actions: icons
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: Transform.rotate(
                              angle: e == Icons.notifications_none
                                  ? -pi / 12.0
                                  : 0,
                              child: Icon(
                                e,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                            onPressed: e == Icons.shopping_bag_outlined
                                ? () => Navigator.of(context).push(
                                    CupertinoPageRoute(
                                        builder: (context) => const CartPage()))
                                : () => {},
                          ),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      ((1 - (1 / 1.1)) / 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Hot deals \u{1F525}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: StackedListView(
                        imageSrcs: List.generate(
                            5,
                            (index) =>
                                "assets/banners/banner_${index + 1}.jpeg",
                            growable: false)),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 13,
                      child: const CategoryListView()),
                  const ProductGridView()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
