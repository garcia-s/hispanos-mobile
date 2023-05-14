import 'package:flutter/material.dart';
import 'package:hispanosmobile/pages/index_page/mockup/mockup_horizontal_item.dart';
import 'package:hispanosmobile/pages/index_page/mockup/mockup_vertical_item.dart';
import 'package:hispanosmobile/widgets/shimmers/base_shimmer.dart';
import 'package:hispanosmobile/widgets/shimmers/shimmer_text.dart';

class MockupIndexContent extends StatelessWidget {
  const MockupIndexContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BaseShimmer(
            child: Container(
              color: Colors.white70,
              height: 300,
            ),
          ),
        ),
        SliverFixedExtentList.builder(
          itemExtent: 180,
          itemCount: 4,
          itemBuilder: (ctx, i) => const MockupListVerticalItem(),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerText(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 25,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      MockupHorizontalItem(),
                      MockupHorizontalItem(),
                      MockupHorizontalItem(),
                      MockupHorizontalItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFixedExtentList.builder(
          itemExtent: 180,
          itemCount: 4,
          itemBuilder: (ctx, i) => const MockupListVerticalItem(),
        )
      ],
    );
  }
}
