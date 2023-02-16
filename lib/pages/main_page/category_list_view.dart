import 'package:flutter/material.dart';

import 'category_clip.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      children: List.generate(
          6,
          (index) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CategoryChip(
                  icon: '\u{1f4bb}', title: 'Laptop', isSelected: index == 0))),
    );
  }
}
