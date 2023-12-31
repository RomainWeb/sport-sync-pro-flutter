import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';

class DayDatePicker extends StatefulWidget {
  const DayDatePicker({super.key});

  @override
  State<DayDatePicker> createState() => _DayDatePickerState();
}

class _DayDatePickerState extends State<DayDatePicker> {
  DateTime? _currentDate = DateTime.now();

  bool _compareDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
      child: Container(
        height: 90.0,
        child: ListView.builder(
          itemCount: 31,
          scrollDirection: Axis.horizontal,
          controller: _controller,
          itemBuilder: (context, index) {
            DateTime date;
            DateTime _date = DateTime.now().add(Duration(days: index));
            date = DateTime(_date.year, _date.month, _date.day);

            bool isSelected =
            _currentDate != null ? _compareDate(date, _currentDate!) : false;

            return InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Container(
                width: 50.0,
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  color: isSelected ? AppColors.primaryColor : Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        DateFormat("MMM", 'en_US').format(date).toUpperCase(),
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                        ),
                      ),
                      Text(
                        DateFormat("E", 'en_US').format(date).toUpperCase(),
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 4.0,),
                      Builder(
                        builder: (context) {
                          if (isSelected) { // Replace if there is an event
                            return Container(
                              height: 4.0,
                              width: 4.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              ),
                            );
                          }
                          return Container();
                        },
                      )
                    ],
                  ),
                ),
              ),
              onTap: () async {
                await _controller.animateTo(
                  index * 50,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                setState(() {
                  _currentDate = date;
                });
              },
            );
          }
        ),
      ),
    );
  }
}
