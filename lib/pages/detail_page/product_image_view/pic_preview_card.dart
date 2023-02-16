import 'package:flutter/material.dart';

class PicPreviewCard extends StatefulWidget {
  final bool isCurrentPage;
  final String imageSrc;
  final VoidCallback? onTap;
  const PicPreviewCard(
      {super.key,
      required this.isCurrentPage,
      required this.imageSrc,
      this.onTap});

  @override
  State<PicPreviewCard> createState() => _PicPreviewCardState();
}

class _PicPreviewCardState extends State<PicPreviewCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    if (widget.isCurrentPage) _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PicPreviewCard oldWidget) {
    if (oldWidget.isCurrentPage != widget.isCurrentPage) {
      widget.isCurrentPage
          ? _animationController.forward()
          : _animationController.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (widget.isCurrentPage == false) {
          _animationController.forward();
        }
        widget.onTap?.call();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            clipBehavior: Clip.hardEdge,
            height: size.width / 20,
            width: size.width / 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: const Color.fromARGB(255, 48, 60, 80),
                    width: _animationController.value * 3),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 5 * _animationController.value),
                      color: Colors.grey.shade300.withOpacity(0.5),
                      blurRadius: _animationController.value * 10),
                ]),
            child: child,
          );
        },
        child: Image.network(widget.imageSrc, fit: BoxFit.fill),
      ),
    );
  }
}
