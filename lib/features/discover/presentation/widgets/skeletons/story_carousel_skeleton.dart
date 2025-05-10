import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StoryCarouselSkeleton extends StatelessWidget {
  const StoryCarouselSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 400,
        child: CarouselView(
          itemExtent: MediaQuery.sizeOf(context).width * 0.6,
          shrinkExtent: MediaQuery.sizeOf(context).width * 0.6,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
