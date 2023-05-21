import 'package:flutter/material.dart';
import 'package:hispanosmobile/widgets/shimmers/base_shimmer.dart';

class MockupMagazineItem extends StatelessWidget {
  const MockupMagazineItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Stack(
        children: [
          BaseShimmer(
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.canvasColor,
              ),
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class MockupMagazineSection extends StatelessWidget {
  const MockupMagazineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            Container(),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) => const MockupMagazineItem(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
