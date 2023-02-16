import 'package:flutter/material.dart';

import '../../model/product_options.dart';

class SelectableColorOptions extends StatefulWidget {
  final List<ColorOption> options;
  final Function(String)? onTap;
  const SelectableColorOptions({super.key, required this.options, this.onTap});

  @override
  State<SelectableColorOptions> createState() => _SelectableColorOptionsState();
}

class _SelectableColorOptionsState extends State<SelectableColorOptions> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.options[_currentIndex].colorName,
          style: const TextStyle(fontSize: 14),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.options.map((option) {
            final index = widget.options.indexOf(option);
            return GestureDetector(
              onTap: () => {setState(() => _currentIndex = index)},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  clipBehavior: Clip.hardEdge,
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: MediaQuery.of(context).size.width * 0.08,
                  padding: EdgeInsets.all(_currentIndex == index ? 2.0 : 0.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: _currentIndex == index
                          ? Border.all(
                              color: Color(option.colorValue), width: 2.0)
                          : null),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(option.colorValue),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
