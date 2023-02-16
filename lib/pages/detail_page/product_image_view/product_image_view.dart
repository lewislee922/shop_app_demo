import 'package:flutter/material.dart';

import 'pic_preview_card.dart';

class ProductImageView extends StatefulWidget {
  final List<String> imageSrcs;
  final double preferredHeight;
  const ProductImageView(
      {super.key, required this.imageSrcs, this.preferredHeight = 200});

  @override
  State<ProductImageView> createState() => _ProductImageViewState();
}

class _ProductImageViewState extends State<ProductImageView> {
  late PageController _pageController;
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        final ceiledPage = _pageController.page!.ceil();
        if (ceiledPage != _currentPage.value) {
          _currentPage.value = ceiledPage;
        }
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: widget.preferredHeight,
      child: Stack(children: [
        Positioned(
          left: width * 0.15,
          top: 0,
          child: SizedBox(
            width: width * 1.0,
            height: widget.preferredHeight,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageSrcs.length,
              itemBuilder: (context, index) => Image.network(
                widget.imageSrcs[index],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          left: width * ((1 - (1 / 1.1)) / 2),
          top: widget.preferredHeight * 0.02,
          child: SizedBox(
              width: width * 0.2,
              child: ValueListenableBuilder(
                  valueListenable: _currentPage,
                  builder: (context, page, _) {
                    return Column(
                        children: widget.imageSrcs.map((src) {
                      final pageIndex = widget.imageSrcs.indexOf(src);
                      return SizedBox(
                          height: width * 0.17,
                          width: width * 0.17,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: PicPreviewCard(
                                key: ValueKey(pageIndex),
                                imageSrc: src,
                                isCurrentPage: page == pageIndex,
                                onTap: () {
                                  if (page != pageIndex) {
                                    _pageController.animateToPage(pageIndex,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                  }
                                },
                              )));
                    }).toList());
                  })),
        )
      ]),
    );
  }
}
