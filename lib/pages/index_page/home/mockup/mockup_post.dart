import 'package:flutter/material.dart';
import "package:hispanosmobile/widgets/shimmers/base_shimmer.dart";
import "package:hispanosmobile/widgets/shimmers/shimmer_text.dart";

class MockupPostItem extends StatelessWidget {
  const MockupPostItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor,
            width: 1,
          ),
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: theme.textTheme.headlineLarge!.fontSize! / 2,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: theme.textTheme.bodyMedium!.fontSize! / 2,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerText(
                    child: Container(
                      height: theme.textTheme.titleLarge!.fontSize!,
                      margin: EdgeInsets.fromLTRB(
                        0,
                        0,
                        70,
                        theme.textTheme.titleLarge!.fontSize! / 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          theme.textTheme.titleLarge!.fontSize! / 2,
                        ),
                      ),
                    ),
                  ),
                  ShimmerText(
                    child: Container(
                      height: theme.textTheme.titleLarge!.fontSize!,
                      margin: const EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          theme.textTheme.titleLarge!.fontSize! / 2,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  ShimmerText(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: theme.textTheme.bodyLarge!.fontSize! / 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(87, 87, 87, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: theme.textTheme.bodyLarge!.fontSize!,
                      width: 200,
                    ),
                  ),
                  ShimmerText(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: theme.textTheme.bodyLarge!.fontSize! / 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(87, 87, 87, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: theme.textTheme.bodyLarge!.fontSize!,
                      width: 140,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BaseShimmer(
                child: Container(
                  height: 170,
                  width: 170,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MockupPostSection extends StatelessWidget {
  const MockupPostSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList.builder(
      itemExtent: 180,
      itemCount: 4,
      itemBuilder: (ctx, i) => const MockupPostItem(),
    );
  }
}
