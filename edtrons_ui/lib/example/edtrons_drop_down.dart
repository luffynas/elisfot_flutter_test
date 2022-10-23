import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';

class EdtronsDropDown extends StatelessWidget {
  const EdtronsDropDown({
    super.key,
    required this.focus,
    this.genderCurrent,
    this.onGenderSelected,
  });

  final FocusNode focus;
  final String? genderCurrent;
  final ValueChanged<String>? onGenderSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Down'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Jenis Kelamin',
                style: AppTypography.normalMedium,
              ),
            ),
            GestureDetector(
              onTap: () {
                // FocusScope.of(context).requestFocus(focus);
                _buildGenderAction(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: AppRadius.lg,
                  border: Border.all(
                    color: AppColors.gray[200]!,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: AppColors.gray[700],
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Hello',
                        style: AppTypography.extraSmallRegular,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        AppIcons.ic_chevron_down,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildGenderAction(BuildContext context) {
    return showModalBottomSheetDynamic(
      context,
      title: 'Detail Murid',
      titlePosition: Alignment.centerLeft,
      topDevider: false,
      // height: 180,
      target: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              // onGenderSelected!.call(state.genderSelected!.title);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'menu.title',
                      style: AppTypography.smallMedium,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
