import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:edtrons_ui/src/date/date_time_formatted.dart';
import 'package:flutter/material.dart';

class EdtronsDateStartOptionWidget extends StatefulWidget {
  const EdtronsDateStartOptionWidget({super.key, required this.onSelectedDate});

  final ValueChanged<DateTime> onSelectedDate;

  @override
  State<EdtronsDateStartOptionWidget> createState() =>
      _EdtronsDateStartOptionWidgetState();
}

class _EdtronsDateStartOptionWidgetState
    extends State<EdtronsDateStartOptionWidget> {
  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  // DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  DateTime selectedDate = DateTime.now();
  final lastDate = DateTime(DateTime.now().year + 5);

  String? dateSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // FocusScope.of(context).requestFocus(focus);
        // _buildLeaveStartDateOption(context);
        await _selectDate(context);
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
            Expanded(
              child: Text(
                dateSelected ?? 'Tanggal Mulai',
                style: AppTypography.smallRegular,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                AppIcons.ic_calendar_line,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      // initialDate:
      //     selectedDate.isBefore(currentDate) ? currentDate : selectedDate,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onSelectedDate.call(selectedDate);
        // _createEventModel.startTime = _getStartDate();
        // selectedEndDate = selectedDate;
        dateSelected = formatedYYYYMMDD(_getStartDate().toInt());
      });
    }
  }

  double _getStartDate() {
    final date = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
    return date.toUtc().millisecondsSinceEpoch.toDouble() / 1000;
  }

  // Future<dynamic> _buildLeaveStartDateOption(BuildContext context) {
  //   return showModalBottomSheetDynamic(
  //     context,
  //     title: 'Detail Murid',
  //     titlePosition: Alignment.centerLeft,
  //     topDevider: false,
  //     // height: 180,
  //     target: ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: 10,
  //       itemBuilder: (context, index) {
  //         return GestureDetector(
  //           onTap: () {
  //             Navigator.of(context).pop();
  //             // onGenderSelected!.call(state.genderSelected!.title);
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 8),
  //             child: Row(
  //               children: [
  //                 Expanded(
  //                   child: Text(
  //                     'menu.title',
  //                     style: AppTypography.smallMedium,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
