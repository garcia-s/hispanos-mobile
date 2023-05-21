import 'package:flutter/material.dart';
import 'package:hispanosmobile/widgets/shimmers/base_shimmer.dart';
import 'package:hispanosmobile/widgets/shimmers/shimmer_text.dart';

class MockupHighlightedPodcastItem extends StatelessWidget {
  const MockupHighlightedPodcastItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(15),
      height: 300,
      width: 350,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BaseShimmer(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          ShimmerText(
            child: Container(
              height: theme.textTheme.titleMedium!.fontSize,
              margin: EdgeInsets.only(
                top: theme.textTheme.titleMedium!.fontSize!,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          ShimmerText(
            child: Container(
              height: theme.textTheme.titleMedium!.fontSize,
              width: 240,
              margin: EdgeInsets.symmetric(
                vertical: theme.textTheme.titleMedium!.fontSize! / 2,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MockupHighlightedPodcastSection extends StatelessWidget {
  const MockupHighlightedPodcastSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: theme.textTheme.headlineSmall!.fontSize!,
        ),
        height: 330,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.1, color: Colors.white),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerText(
              child: Container(
                height: theme.textTheme.headlineSmall!.fontSize!,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: theme.textTheme.headlineSmall!.fontSize! / 2),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  MockupHighlightedPodcastItem(),
                  MockupHighlightedPodcastItem(),
                  MockupHighlightedPodcastItem(),
                  MockupHighlightedPodcastItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
