import 'package:edtrons_ui/example/edtrons_drop_down.dart';
import 'package:edtrons_ui/example/form_control_screen.dart';
import 'package:edtrons_ui/example/image_screen.dart';
import 'package:edtrons_ui/example/radius_screen.dart';
import 'package:edtrons_ui/example/shadow_screen.dart';
import 'package:edtrons_ui/example/widget_screen.dart';
import 'package:edtrons_ui/themes/themes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeLight(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RadiusScreen()),
                );
              },
              child: const Text('Sample Radius'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ShadowScreen()),
                );
              },
              child: const Text('Sample Shadow'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const WidgetScreen()),
                );
              },
              child: const Text('Sample Widget'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const FormControllerScreen()),
                );
              },
              child: const Text('Sample Form'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => EdtronsDropDown(
                            focus: focusNode,
                          )),
                );
              },
              child: const Text('Sample Drop Down'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ImageScreen()),
                );
              },
              child: const Text('Sample Image'),
            ),
          ],
        ),
      ),
    );
  }
}
