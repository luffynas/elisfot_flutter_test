import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';

import 'loading_indicator.dart';

enum Status { DEFAULT, SUCCESS, FAILED, WARNING, CANCELED }

Future<void> showSnackBar(
  BuildContext context,
  String message,
  Status status,
) async {
  late Widget _icon;
  late Color backgroundColor;
  switch (status) {
    case Status.SUCCESS:
      backgroundColor = AppColors.green;
      _icon = const Icon(
        AppIcons.ic_circle_check,
        color: Colors.white,
        size: 18,
      );
      break;
    case Status.WARNING:
      backgroundColor = Colors.yellow;
      _icon = const Icon(
        Icons.warning,
        color: Colors.black45,
        size: 18,
      );
      break;
    case Status.FAILED:
      backgroundColor = Colors.red;
      _icon = const Icon(
        Icons.close,
        color: Colors.red,
        size: 18,
      );
      break;
    case Status.DEFAULT:
      backgroundColor = Colors.white;
      _icon = const Icon(
        Icons.close,
        color: Colors.red,
        size: 18,
      );
      break;
    case Status.CANCELED:
      backgroundColor = Colors.white;
      _icon = const Icon(
        Icons.close,
        color: Colors.red,
        size: 18,
      );
      break;
  }
  final snackBar = SnackBar(
    backgroundColor: backgroundColor,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              message,
              style: AppTypography.smallRegular.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
        _icon,
      ],
    ),
  );

  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(snackBar);
}

bool _isShowing = false;
Future<bool> showLoading(BuildContext context, String message,
    {bool isDismissable = false}) async {
  _isShowing = true;
  return await showDialog<bool>(
        context: context,
        barrierDismissible: isDismissable,
        builder: (context) {
          return Dialog(
            child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 40, height: 40, child: LoadingIndicator()),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Text("$message"),
                    )
                  ],
                )),
          );
        },
      ) ??
      !_isShowing;
}

dissmissLoading(BuildContext context) {
  print('context $context');
  if (_isShowing) {
    _isShowing = false;
    try {
      Navigator.pop(context);
      print('context dismiss');
    } catch (error) {
      print('context dismiss error $error');
      Navigator.of(context).dispose();
    }
  }
}
