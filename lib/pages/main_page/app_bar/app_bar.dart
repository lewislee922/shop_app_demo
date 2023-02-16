import 'package:flutter/material.dart';

import '/pages/main_page/app_bar/background_blur_layer.dart';

class GradientAppBar extends StatelessWidget {
  final double preferredHeight;
  final String title;
  final ImageProvider? avatar;
  final List<Widget>? actions;
  const GradientAppBar(
      {super.key,
      required this.preferredHeight,
      List<Widget>? actions,
      ImageProvider? avatar,
      required this.title})
      : actions = actions,
        avatar = avatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: preferredHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BackgroundBlurLayer(
            preferredHeight: preferredHeight,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(end: Alignment.topRight, colors: [
              const Color.fromARGB(255, 89, 43, 226),
              const Color.fromARGB(255, 89, 43, 226).withOpacity(0.7),
              const Color.fromARGB(255, 89, 43, 226).withOpacity(0.6),
              const Color.fromARGB(255, 89, 43, 226).withOpacity(0.5)
            ], stops: const [
              0,
              0.3,
              0.7,
              1.0
            ])),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * ((1 - (1 / 1.1)) / 2),
            child: SafeArea(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 1.1),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          foregroundImage: avatar,
                          radius: preferredHeight / 12,
                        ),
                        Row(children: actions ?? [])
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * ((1 - (1 / 1.1)) / 2),
            bottom: -preferredHeight / 15,
            child: Material(
              clipBehavior: Clip.hardEdge,
              elevation: 4.0,
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                height: preferredHeight / 4.5,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8.0),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        hintText: "Search laptop, headset, etc..."),
                  ))
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
