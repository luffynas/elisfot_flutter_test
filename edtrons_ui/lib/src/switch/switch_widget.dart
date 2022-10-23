import 'package:edtrons_ui/src/widget_type.dart';
import 'package:flutter/cupertino.dart';

class EdtronsSwitch extends StatelessWidget {
  const EdtronsSwitch({
    super.key,
    this.widgetType = WidgetType.md,
    this.alignment = Alignment.center,
    this.activeColor,
    this.thumbColor,
    this.trackColor,
    this.value = false,
    this.onChanged,
  });

  final WidgetType widgetType;
  final AlignmentGeometry alignment;
  final Color? activeColor;
  final Color? thumbColor;
  final Color? trackColor;
  final bool value;
  final ValueChanged<bool>? onChanged;

  double get scale {
    switch (widgetType) {
      case WidgetType.xs:
        return 20;
      case WidgetType.sm:
        return 24;
      case WidgetType.md:
        return 32;
      case WidgetType.lg:
        return 40;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scale,
      // width: 100,
      child: FittedBox(
        fit: BoxFit.contain,
        child: CupertinoSwitch(
          value: value,
          activeColor: activeColor,
          thumbColor: thumbColor,
          trackColor: trackColor,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
