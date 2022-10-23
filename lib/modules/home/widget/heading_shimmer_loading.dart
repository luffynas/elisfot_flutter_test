import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HeadingShimmerLoading extends StatelessWidget {
  const HeadingShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 1.7,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: AppRadius.lg,
                border: Border.all(
                  color: AppColors.shimmerHiglight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: AppColors.shimmer,
                    highlightColor: AppColors.shimmerHiglight,
                    child: Container(
                      width: 120,
                      height: 12,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.sm,
                        color: AppColors.shimmer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Shimmer.fromColors(
                      baseColor: AppColors.shimmer,
                      highlightColor: AppColors.shimmerHiglight,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 12,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.sm,
                          color: AppColors.shimmer,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Shimmer.fromColors(
                      baseColor: AppColors.shimmer,
                      highlightColor: AppColors.shimmerHiglight,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 12,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.sm,
                          color: AppColors.shimmer,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Shimmer.fromColors(
                      baseColor: AppColors.shimmer,
                      highlightColor: AppColors.shimmerHiglight,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 12,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.sm,
                          color: AppColors.shimmer,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Shimmer.fromColors(
                      baseColor: AppColors.shimmer,
                      highlightColor: AppColors.shimmerHiglight,
                      child: Container(
                        width: 100,
                        height: 12,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.sm,
                          color: AppColors.shimmer,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
      ),
    );
  }
}
