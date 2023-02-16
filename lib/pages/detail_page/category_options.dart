import 'dart:math';

import 'package:flutter/material.dart';
import '../../model/product_options.dart';

class SelectableSpecOption extends StatefulWidget {
  final SpecOption option;
  const SelectableSpecOption({super.key, required this.option});

  @override
  State<SelectableSpecOption> createState() => _SelectableSpecOptionState();
}

class _SelectableSpecOptionState extends State<SelectableSpecOption> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.option.category),
          const SizedBox(height: 4.0),
          GestureDetector(
            onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(widget.option.category),
                      content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0;
                                i < widget.option.options.length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() => _currentIndex = i);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(widget.option.options[i])),
                              )
                          ]),
                    )),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.option.options[_currentIndex],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Transform.rotate(
                          angle: -pi / 2,
                          child: const Icon(Icons.arrow_back_ios_outlined))
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
