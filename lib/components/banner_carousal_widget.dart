import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_renderer/components/banner_widget.dart';
import 'package:ui_renderer/models/banner_carousal.dart';

class BannerCarousalWidget extends StatefulWidget {
  final BannerCarousal bannerCarousal;

  const BannerCarousalWidget({
    super.key,
    required this.bannerCarousal,
  });

  @override
  State<BannerCarousalWidget> createState() => _BannerCarousalWidgetState();
}

class _BannerCarousalWidgetState extends State<BannerCarousalWidget> {
  final PageController controller = PageController();
  int currentPage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });

    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(!widget.bannerCarousal.isValid){
      return const Placeholder(
        fallbackHeight: 150,
      );
    }
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: BannerWidget(
                  banner: widget
                      .bannerCarousal.banners[currentPage % widget.bannerCarousal.banners.length],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        _progressBar,
      ],
    );
  }

  Widget get _progressBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.bannerCarousal.banners.length,
        (index) {
          return Container(
            width: 10.0,
            height: 10.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage % widget.bannerCarousal.banners.length == index
                  ? Colors.blue
                  : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
