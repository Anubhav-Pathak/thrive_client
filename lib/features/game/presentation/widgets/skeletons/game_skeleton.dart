import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GameSkeleton extends StatelessWidget {
  const GameSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerContainer(height: 24, width: 200),
          const SizedBox(height: 16),
          ShimmerContainer(height: MediaQuery.of(context).size.height * 0.4, width: double.infinity),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ShimmerContainer(height: 50, width: double.infinity);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
