import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef DateSelectionCallback = void Function(DateTime selectedDate);

class DayDatePickerItem extends StatelessWidget {
  final Color itemColor;
  final Color textColor;
  final bool hasEvent;
  final DateTime date;
  final DateSelectionCallback? onDateSelected;

  const DayDatePickerItem({super.key,
    required this.itemColor,
    required this.textColor,
    required this.date,
    this.hasEvent = false,
    this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        width: 50.0,
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: itemColor,
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
                  color: textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.0,
                ),
              ),
              Text(
                date.day.toString(),
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22.0,
                ),
              ),
              Text(
                DateFormat("E", 'en_US').format(date).toUpperCase(),
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(height: 4.0,),
              Builder(
                builder: (context) {
                  if (hasEvent) { // Replace if there is an event
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
      onTap: () {
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(date);
        }
      },
    );
  }
}
