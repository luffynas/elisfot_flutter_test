import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';

class EdtronsCheckboxWidget extends StatelessWidget {
  const EdtronsCheckboxWidget({
    super.key,
    required this.title,
    required this.onChanged,
    this.value = false,
  });

  final String title;
  final bool value;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged.call(!value);
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Checkbox(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: value,
                onChanged: onChanged,
              ),
            ),
            const SizedBox(width: 8),
            Text(title, style: AppTypography.smallRegular),
          ],
        ),
      ),
    );
  }
}
