import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';

class SectionProfileWidget extends StatelessWidget {
  const SectionProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: RichText(
          text: TextSpan(
            children: <InlineSpan>[
              TextSpan(
                text: 'Welcome, ',
                style: AppTypography.smallRegular,
              ),
              TextSpan(
                text: 'Username',
                style: AppTypography.mediumMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
