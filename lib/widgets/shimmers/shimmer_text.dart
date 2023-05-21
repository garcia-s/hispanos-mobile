import 'package:flutter/material.dart';
import 'package:hispanosmobile/widgets/shimmers/base_shimmer.dart';

class ShimmerText extends StatelessWidget {
  final Widget child;
  const ShimmerText({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BaseShimmer(child: child);
  }
}
