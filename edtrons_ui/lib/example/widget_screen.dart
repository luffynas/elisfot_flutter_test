import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:edtrons_ui/src/widget_type.dart';
import 'package:flutter/material.dart';

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Widget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Sample Switch Widget SM'),
            EdtronsSwitch(
              value: false,
              widgetType: WidgetType.sm,
              onChanged: (value) {},
            ),
            EdtronsSwitch(
              value: true,
              widgetType: WidgetType.sm,
              onChanged: (value) {},
            ),
            const Text('Sample Switch Widget MD'),
            EdtronsSwitch(
              value: false,
              widgetType: WidgetType.md,
              onChanged: (value) {},
            ),
            EdtronsSwitch(
              value: true,
              widgetType: WidgetType.md,
              onChanged: (value) {},
            ),
            const Text('Sample Switch Widget LG'),
            EdtronsSwitch(
              value: false,
              widgetType: WidgetType.lg,
              onChanged: (value) {},
            ),
            EdtronsSwitch(
              value: true,
              widgetType: WidgetType.lg,
              onChanged: (value) {},
            ),
            const Text('Sample Button SM'),
            FittedBox(
              child: EdtronsButton(
                widgetType: WidgetType.xs,
                title: 'Edtrons Button',
                onPressed: () {},
              ),
            ),
            const Text('Sample Button SM'),
            FittedBox(
              child: EdtronsButton(
                widgetType: WidgetType.sm,
                title: 'Edtrons Button',
                onPressed: () {},
              ),
            ),
            const Text('Sample Button MD'),
            FittedBox(
              child: EdtronsButton(
                widgetType: WidgetType.md,
                title: 'Edtrons Button',
                onPressed: () {},
              ),
            ),
            const Text('Sample Button LG'),
            FittedBox(
              child: EdtronsButton(
                widgetType: WidgetType.lg,
                title: 'Edtrons Button',
                onPressed: () {},
              ),
            ),
            const Text('Sample Button Extra Small Icon'),
            FittedBox(
              child: EdtronsButton(
                widgetType: WidgetType.xs,
                title: 'Edtrons Button',
                prefixIcon: const Icon(
                  Icons.check,
                  size: 16,
                ),
                suffixIcon: const Icon(
                  Icons.check,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
            const Text('Sample Button SM Icon'),
            FittedBox(
              child: EdtronsButton(
                widgetType: WidgetType.sm,
                title: 'Edtrons Button',
                prefixIcon: const Icon(
                  Icons.check,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
            const Text('Sample Button MD Icon'),
            FittedBox(
              child: EdtronsButton(
                widgetType: WidgetType.md,
                title: 'Edtrons Button',
                suffixIcon: const Icon(
                  Icons.check,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
            const Text('Sample Button LG Icon'),
            FittedBox(
              child: EdtronsButton(
                widgetType: WidgetType.lg,
                title: 'Edtrons Button',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
