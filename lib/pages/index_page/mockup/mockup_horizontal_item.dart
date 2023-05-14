import 'package:flutter/material.dart';
import 'package:hispanosmobile/widgets/shimmers/base_shimmer.dart';
import 'package:hispanosmobile/widgets/shimmers/shimmer_text.dart';

class MockupHorizontalItem extends StatelessWidget {
  const MockupHorizontalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 300,
      width: 350,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 90, 90, 90),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: BaseShimmer(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          ShimmerText(
            child: Container(
              height: 20,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
