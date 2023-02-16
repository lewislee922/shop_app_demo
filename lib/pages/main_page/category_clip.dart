import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  const CategoryChip(
      {super.key,
      required this.icon,
      required this.title,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),
      backgroundColor: isSelected
          ? const Color.fromARGB(255, 48, 60, 80)
          : Colors.transparent,
      avatar: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.white : Colors.grey.shade300),
        child: RichText(
          text: TextSpan(text: icon, style: const TextStyle(fontSize: 16)),
        ),
      ),
      label: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
      onPressed: () => {},
    );
  }
}
