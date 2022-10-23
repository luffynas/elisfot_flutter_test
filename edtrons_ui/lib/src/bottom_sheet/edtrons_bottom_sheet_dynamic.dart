import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';

Future<void> showModalBottomSheetDynamic(
  BuildContext context, {
  bool topDevider = true,
  String? title,
  Widget? target,
  double? height,
  Color? barrierColor,
  double radius = 16,
  AlignmentGeometry titlePosition = Alignment.center,
  EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  ),
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: barrierColor,
    builder: (BuildContext context) {
      return Container(
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
          color: AppColors.gray[10],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Visibility(
              visible: topDevider,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16, top: 4),
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.gray[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: title != null,
              child: Align(
                alignment: titlePosition,
                child: SizedBox(
                  // padding: const EdgeInsets.only(
                  //   top: 8,
                  //   bottom: 8,
                  // ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title ?? '',
                          style: AppTypography.normalMedium,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: AppRadius.lg,
                            color: AppColors.gray[200],
                          ),
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: AppColors.gray[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: title != null,
              child: const SizedBox(
                height: 16,
              ),
            ),
            // ConstrainedBox(
            //   constraints: new BoxConstraints(
            //     maxHeight: MediaQuery.of(context).size.height /
            //         4.0 *
            //         3.0, //this height is not contain `Text("Just a title")`'s height.
            //   ),
            //   child: target,
            // ),
            target ?? const SizedBox()
          ],
        ),
      );
    },
  );
}
