import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundBlurLayer extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double preferredHeight;
  BackgroundBlurLayer(
      {super.key,
      required this.preferredHeight,
      Color? primaryColor,
      Color? secondaryColor})
      : primaryColor = primaryColor ?? const Color.fromARGB(255, 151, 236, 255),
        secondaryColor = secondaryColor ?? Colors.pink.shade300;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        SizedBox.expand(
          child: Container(
              color: const Color.fromARGB(255, 89, 43, 226).withOpacity(0.5)),
        ),
        Positioned(
          top: -width / 4,
          left: width / 6,
          child: Container(
            width: width / 1.5,
            height: width / 1.5,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
          ),
        ),
        Positioned(
          right: -width / 6,
          top: preferredHeight / 3,
          child: Container(
            width: width / 1.5,
            height: width / 1.5,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: secondaryColor),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          child: const SizedBox.expand(),
        )
      ],
    );
  }
}
