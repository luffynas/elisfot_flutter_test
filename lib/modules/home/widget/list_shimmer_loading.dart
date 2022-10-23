import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmerLoading extends StatelessWidget {
  const ListShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: AppColors.shimmer,
                    highlightColor: AppColors.shimmerHiglight,
                    child: Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.lg,
                        color: AppColors.shimmer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: AppColors.shimmer,
                        highlightColor: AppColors.shimmerHiglight,
                        child: Container(
                          width: 160,
                          height: 12,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: AppRadius.sm,
                            color: AppColors.shimmer,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
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
                    ],
                  )
                ],
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
              Container(
                alignment: Alignment.centerRight,
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
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }
}
