// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:ibnt/src/shared/shared_imports.dart';

class AppDateWidget extends StatelessWidget {
  const AppDateWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DateCubit>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final weekDayContainerHeight = height * 0.06;
    final monthDayContainerSize = height * 0.05;
    final labelFontSize = height * 0.03;
    final monthDayFontSize = height * 0.025;
    final currentMonth = DateTime.now().month;
    final list = getMonthDays(currentMonth);
    return SizedBox(
      height: height * 0.45,
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mês atual",
                style: TextStyle(
                  fontSize: labelFontSize,
                ),
              ),
              Text(
                getMonthName(currentMonth),
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
                    child: BlocBuilder<DateCubit, DateModel>(
                      bloc: cubit,
                      builder: (context, state) {
                        final announcement = state;
                        if (cubit.loading) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: DaysOfWeek.values.length,
                            mainAxisExtent: monthDayContainerSize,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (_, i) {
                            var monthDay = list[i];
                            final selectedDay = announcement.day == monthDay;
                            return InkWell(
                              onTap: () => cubit.changeAnnouncementDate(monthDay),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedDay ? AppThemes.primaryColor1 : Colors.white,
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
                                    style: TextStyle(
                                      color: selectedDay ? Colors.white : AppThemes.primaryColor1,
                                      fontWeight: FontWeight.w400,
                                      fontSize: monthDayFontSize,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
}
