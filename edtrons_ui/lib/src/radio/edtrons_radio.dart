import 'package:edtrons_ui/themes/themes.dart';
import 'package:flutter/material.dart';

class EdtronsRadio extends StatelessWidget {
  const EdtronsRadio({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final String title;
  final dynamic value;
  final ValueChanged<dynamic>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: value,
          groupValue: 0,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: AppTypography.smallMedium.copyWith(
            color: AppColors.gray[700],
          ),
        )
      ],
    );
  }
}
