import 'package:edtrons_ui/styles/style.dart';
import 'package:edtrons_ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EdtronsTextForm extends StatelessWidget {
  const EdtronsTextForm({
    Key? key,
    this.readOnly = false,
    this.enable = true,
    this.textInputType = TextInputType.name,
    this.onSubmited,
    this.onChanged,
    this.labelText = '',
    this.labelTextRight = '',
    this.textController,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.radius = 10.0,
    this.isDense = false,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.onLabelPressed,
    this.inputDecoration,
    this.wrappedBorder,
    this.wrappedBorderPadding,
    this.focusNode,
    this.maxLength,
    this.buildCounter,
    this.inputFormatters,
    this.helperText,
  }) : super(key: key);
  final bool readOnly;
  final bool enable;
  final TextInputType textInputType;
  final TextInputType keyboardType;
  final ValueChanged? onSubmited;
  final ValueChanged? onChanged;
  final String labelText;
  final String labelTextRight;
  final TextEditingController? textController;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String? obscuringCharacter;
  final int maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double radius;
  final bool isDense;
  final String? hintText;
  final VoidCallback? onLabelPressed;
  final InputDecoration? inputDecoration;
  final BoxDecoration? wrappedBorder;
  final EdgeInsetsGeometry? wrappedBorderPadding;
  final FocusNode? focusNode;
  final int? maxLength;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: labelText.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  labelText,
                  style: AppTypography.smallRegular,
                ),
              ),
            ),
            Visibility(
              visible: labelTextRight.isNotEmpty,
              child: GestureDetector(
                onTap: onLabelPressed,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    labelTextRight,
                    style: AppTypography.extraSmallBold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: wrappedBorder,
          padding: wrappedBorderPadding,
          child: TextField(
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            buildCounter: buildCounter,
            controller: textController,
            focusNode: focusNode,
            textAlign: TextAlign.left,
            decoration: inputDecoration ??
                InputDecoration(
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  filled: true,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  isDense: isDense,
                  hintText: hintText,
                  helperText: helperText,
                  helperStyle: AppTypography.extraSmallRegular.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  helperMaxLines: 2,
                  contentPadding: const EdgeInsets.only(top: 16),
                  fillColor: readOnly ? AppColors.gray[100] : Colors.white,
                  hintStyle: AppTypography.smallRegular.copyWith(
                    color: const Color(0xFFc0c3cb),
                  ),
                  prefix: prefixIcon != null
                      ? const SizedBox(width: 8)
                      : const SizedBox(width: 16),
                  suffix: suffixIcon != null
                      ? const SizedBox(width: 8)
                      : const SizedBox(width: 16),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: AppColors.gray[200]!,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: AppRadius.lg,
                    borderSide: BorderSide(
                      color:
                          readOnly ? Colors.transparent : AppColors.gray[200]!,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: AppRadius.lg,
                    borderSide: BorderSide(
                      color: AppColors.gray[200]!,
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: AppRadius.lg,
                    borderSide: BorderSide(
                      color: AppColors.gray[200]!,
                    ),
                  ),
                ),
            textInputAction: textInputAction,
            enabled: enable,
            style: AppTypography.smallRegular,
            maxLines: maxLines,
            autocorrect: false,
            keyboardType: keyboardType,
            onEditingComplete: () {},
            onSubmitted: onSubmited,
            onChanged: onChanged,
            readOnly: readOnly,
            obscureText: obscureText,
            // obscuringCharacter: this.obscuringCharacter,
          ),
        ),
      ],
    );
  }
}
