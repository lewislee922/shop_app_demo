import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class StackedListView extends StatelessWidget {
  final List<String> imageSrcs;
  const StackedListView({super.key, required this.imageSrcs});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return IgnorePointer(
        child: Swiper(
          autoplay: true,
          autoplayDelay: 2000,
          itemCount: imageSrcs.length,
          layout: SwiperLayout.DEFAULT,
          itemBuilder: (context, index) => Container(
            key: ValueKey(index),
            clipBehavior: Clip.hardEdge,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Image.asset(
              key: ValueKey(index),
              imageSrcs[index],
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    });
  }
}
