import 'package:flutter/material.dart';
import "package:hispanosmobile/widgets/shimmers/base_shimmer.dart";
import "package:hispanosmobile/widgets/shimmers/shimmer_text.dart";

class MockupListVerticalItem extends StatelessWidget {
  const MockupListVerticalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 116, 116, 116),
            width: 0.5,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ShimmerText(
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ShimmerText(
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  ShimmerText(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(87, 87, 87, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 18,
                      width: 160,
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
