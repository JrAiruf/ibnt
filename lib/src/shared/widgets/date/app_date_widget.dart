// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ibnt/src/shared/shared_imports.dart';

class AppDateWidget extends StatelessWidget {
  const AppDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final weekDayContainerHeight = height * 0.06;
    final monthDayContainerSize = height * 0.055;
    final labelFontSize = height * 0.03;
    final monthDayFontSize = height * 0.025;
    final list = getMonthDays();
    return SizedBox(
      height: height * 0.45,
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Data",
                style: TextStyle(
                  fontSize: labelFontSize,
                ),
              ),
              Text(
                _getMonthName(),
                style: TextStyle(
                  fontSize: labelFontSize,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.025),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: width,
              child: Column(
                children: [
                  Row(
                    children: DaysOfWeek.values
                        .map(
                          (day) => Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppThemes.primaryColor1,
                              ),
                              height: weekDayContainerHeight,
                              child: Center(
                                child: Text(
                                  day.name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: height * 0.001),
                  Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      semanticChildCount: list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: DaysOfWeek.values.length,
                        mainAxisExtent: monthDayContainerSize,
                        mainAxisSpacing: 2,
                      ),
                      itemBuilder: (_, i) {
                        var monthDay = list[i];
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: monthDay == 0
                                  ? null
                                  : Border.all(
                                      color: AppThemes.primaryColor1,
                                    ),
                            ),
                            child: Center(
                              child: Text(
                                monthDay == 0 ? "" : "$monthDay",
                                style: TextStyle(color: AppThemes.primaryColor1, fontWeight: FontWeight.w400, fontSize: monthDayFontSize),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<int> getMonthDays() {
    final date = DateTime.now();
    List<int> month = [];
    var monthSize = _getInDaysMonth(date.month);
    for (var i = 0; i < monthSize; i++) {
      month.add(i + 1);
    }
    var dayInWeekIndex = DateTime(date.year, date.month).weekday + 1;
    for (var i = 1; i < dayInWeekIndex; i++) {
      month.insert(0, 0);
    }
    return month;
  }

  String _getMonthName() {
    final date = DateTime.now();
    String monthName = "";
    switch (date.month) {
      case 1:
        monthName = MonthName.Janeiro.name;
        break;
      case 2:
        monthName = MonthName.Fevereiro.name;
        break;
      case 3:
        monthName = MonthName.Marco.name.replaceAll("c", "ç");
        break;
      case 4:
        monthName = MonthName.Abril.name;
        break;
      case 5:
        monthName = MonthName.Maio.name;
        break;
      case 6:
        monthName = MonthName.Junho.name;
        break;
      case 7:
        monthName = MonthName.Julho.name;
        break;
      case 8:
        monthName = MonthName.Agosto.name;
        break;
      case 9:
        monthName = MonthName.Setembro.name;
        break;
      case 10:
        monthName = MonthName.Outubro.name;
        break;
      case 11:
        monthName = MonthName.Novembro.name;
        break;
      case 12:
        monthName = MonthName.Dezembro.name;
        break;

      default:
        monthName = "";
    }
    return monthName;
  }

  int _getInDaysMonth(int referenceMonth) {
    final date = DateTime.now();
    int daysInMonth = DateTimeRange(
      start: DateTime(date.year, referenceMonth),
      end: DateTime(date.year, referenceMonth + 1),
    ).duration.inDays;
    return daysInMonth;
  }
}

enum DaysOfWeek {
  Dom,
  Seg,
  Ter,
  Qua,
  Qui,
  Sex,
  Sab;
}

enum MonthName {
  Janeiro,
  Fevereiro,
  Marco,
  Abril,
  Maio,
  Junho,
  Julho,
  Agosto,
  Setembro,
  Outubro,
  Novembro,
  Dezembro;
}
