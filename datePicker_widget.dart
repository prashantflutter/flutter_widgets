import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWid extends StatelessWidget {
  DatePickerWid({super.key});
  DateTime? startDate;
  DateTime? endDate;
  ValueNotifier<int> valueListenable = ValueNotifier(0);
  var startDateValue, endDateValue;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: (
          context,
          value,
          child,
        ) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2150),
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    startDate = pickedDate;
                    startDateValue = formattedDate;
                    valueListenable.value++;
                  }
                },
                child: Text(
                  startDate == null ? 'Start Date' : '$startDateValue',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (startDate != null) {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: startDate!.add(Duration(days: 1)),
                      firstDate: startDate!.add(Duration(days: 1)),
                      lastDate: DateTime(2150),
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      endDate = pickedDate;
                      endDateValue = formattedDate;
                      valueListenable.value++;
                    }
                  } else {
                    print('Select start date first after end date');
                  }
                },
                child: Text(
                  endDate == null ? 'End Date' : '$endDateValue',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          );
        });
  }
}
