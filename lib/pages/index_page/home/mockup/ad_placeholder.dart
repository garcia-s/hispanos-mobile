import 'package:flutter/material.dart';
import 'package:hispanosmobile/widgets/shimmers/base_shimmer.dart';

class AdPlaceholder extends StatelessWidget {
  const AdPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BaseShimmer(
        child: Container(
          color: Colors.white70,
          height: 300,
        ),
      ),
    );
  }
}
