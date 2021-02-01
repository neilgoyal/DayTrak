import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/semantics.dart';
import 'package:schoolcalendar/flutter_rounded_date_picker/src/era_mode.dart';
import 'package:schoolcalendar/flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'dart:math' as math;

const _DayPickerGridDelegate _kDayPickerGridDelegate = _DayPickerGridDelegate();
const double _kDayPickerRowHeight = 42.0;
const int _kMaxDayPickerRowCount = 6;
typedef BuilderDayOfDatePicker = Widget Function(DateTime dateTime,
    bool isCurrentDay, bool selected, TextStyle defaultTextStyle);
typedef OnTapDay = bool Function(DateTime dateTime, bool available);

class _DayPickerGridDelegate extends SliverGridDelegate {
  const _DayPickerGridDelegate();
  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    const int columnCount = DateTime.daysPerWeek;
    final double tileWidth = constraints.crossAxisExtent / columnCount;
    final double viewTileHeight =
        constraints.viewportMainAxisExtent / (_kMaxDayPickerRowCount + 1);
    final double tileHeight = math.max(_kDayPickerRowHeight, viewTileHeight);

    return SliverGridRegularTileLayout(
      crossAxisCount: columnCount,
      mainAxisStride: tileHeight,
      crossAxisStride: tileWidth,
      childMainAxisExtent: tileHeight,
      childCrossAxisExtent: tileWidth,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_DayPickerGridDelegate oldDelegate) => false;
}

class FlutterRoundedDayPicker extends StatelessWidget {
  FlutterRoundedDayPicker(
      {Key key,
      @required this.selectedDate,
      @required this.currentDate,
      @required this.onChanged,
      @required this.firstDate,
      @required this.lastDate,
      @required this.displayedMonth,
      this.selectableDayPredicate,
      this.dragStartBehavior = DragStartBehavior.start,
      this.era,
      this.locale,
      this.fontFamily,
      this.borderRadius,
      this.style,
      this.customWeekDays,
      this.builderDay,
      this.listDateDisabled,
      this.onTapDay})
      : assert(selectedDate != null),
        assert(currentDate != null),
        assert(onChanged != null),
        assert(displayedMonth != null),
        assert(dragStartBehavior != null),
        assert(!firstDate.isAfter(lastDate)),
        super(key: key);

  final DateTime selectedDate;
  final DateTime currentDate;
  final ValueChanged<DateTime> onChanged;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime displayedMonth;
  final SelectableDayPredicate selectableDayPredicate;
  final EraMode era;
  final Locale locale;
  final String fontFamily;
  final double borderRadius;
  final MaterialRoundedDatePickerStyle style;
  final List<String> customWeekDays;
  final BuilderDayOfDatePicker builderDay;
  final List<DateTime> listDateDisabled;
  final OnTapDay onTapDay;
  final DragStartBehavior dragStartBehavior;

  List<Widget> _getDayHeaders(
    TextStyle headerStyle,
    MaterialLocalizations localizations,
  ) {
    final List<Widget> result = <Widget>[];
    if (customWeekDays != null) {
      for (int i = 0; i < 7; i++) {
        result.add(ExcludeSemantics(
          child: Center(
              child: Text(
            i < customWeekDays.length ? customWeekDays[i] : "",
            style: headerStyle,
          )),
        ));
      }
    } else {
      for (int i = localizations.firstDayOfWeekIndex; true; i = (i + 1) % 7) {
        final String weekday = localizations.narrowWeekdays[i];
        result.add(ExcludeSemantics(
          child: Center(
              child: Text(
            weekday,
            style: headerStyle,
          )),
        ));
        if (i == (localizations.firstDayOfWeekIndex - 1) % 7) break;
      }
    }

    return result;
  }

  static const List<int> _daysInMonth = <int>[
    31,
    -1,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31,
  ];

  static int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      if (isLeapYear) return 29;
      return 28;
    }
    return _daysInMonth[month - 1];
  }

  int _computeFirstDayOffset(
      int year, int month, MaterialLocalizations localizations) {
    // 0-based day of week, with 0 representing Monday.
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;
    // 0-based day of week, with 0 representing Sunday.
    final int firstDayOfWeekFromSunday = localizations.firstDayOfWeekIndex;
    // firstDayOfWeekFromSunday recomputed to be Monday-based
    final int firstDayOfWeekFromMonday = (firstDayOfWeekFromSunday - 1) % 7;
    // Number of days between the first day of week appearing on the calendar,
    // and the day corresponding to the 1-st of the month.
    return (weekdayFromMonday - firstDayOfWeekFromMonday) % 7;
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    final ThemeData themeData = Theme.of(context);
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final int year = displayedMonth.year;
    final int month = displayedMonth.month;
    final int daysInMonth = getDaysInMonth(year, month);
    final int firstDayOffset = _computeFirstDayOffset(
      year,
      month,
      localizations,
    );

    final List<Widget> labels = _getDayHeaders(
        style?.textStyleDayHeader ?? themeData.textTheme.caption,
        localizations);
    for (int i = 0; true; i += 1) {
      // 1-based day of month, e.g. 1-31 for January, and 1-29 for February on
      // a leap year.
      final int day = i - firstDayOffset + 1;
      if (day > daysInMonth) break;
      if (day < 1) {
        labels.add(Container());
      } else {
        final DateTime dayToBuild = DateTime(year, month, day);
        bool disabled = dayToBuild.isAfter(lastDate) ||
            dayToBuild.isBefore(firstDate) ||
            (selectableDayPredicate != null &&
                !selectableDayPredicate(dayToBuild));

        if (listDateDisabled != null) {
          for (DateTime dt in listDateDisabled) {
            if (dt.day == day && dt.month == month && dt.year == year) {
              disabled = true;
              break;
            }
          }
        }

        BoxDecoration decoration;
        TextStyle itemStyle = style?.textStyleDayOnCalendar ??
            themeData.textTheme.bodyText2.copyWith(
              fontFamily: fontFamily,
            );

        final bool isSelectedDay = selectedDate.year == year &&
            selectedDate.month == month &&
            selectedDate.day == day;
        final bool isCurrentDay = currentDate.year == year &&
            currentDate.month == month &&
            currentDate.day == day;
        if (isSelectedDay) {
          // The selected day gets a circle background highlight, and a contrasting text color.
          itemStyle = style?.textStyleDayOnCalendarSelected ??
              themeData.accentTextTheme.bodyText1.copyWith(
                fontFamily: fontFamily,
              );
          decoration = style?.decorationDateSelected ??
              BoxDecoration(
                color: themeData.accentColor,
                shape: BoxShape.circle,
              );
        } else if (disabled) {
          itemStyle = style?.textStyleDayOnCalendarDisabled ??
              themeData.textTheme.bodyText2.copyWith(
                color: themeData.disabledColor,
                fontFamily: fontFamily,
              );
        } else if (isCurrentDay) {
          // The current day gets a different text color.
          itemStyle = style?.textStyleCurrentDayOnCalendar ??
              themeData.textTheme.bodyText1.copyWith(
                color: themeData.accentColor,
                fontFamily: fontFamily,
              );
        }
        Widget dayWidget;
        if (builderDay != null) {
          dayWidget =
              builderDay(dayToBuild, isCurrentDay, isSelectedDay, itemStyle);
        }

        dayWidget = dayWidget ??
            Container(
              decoration: decoration,
              child: Center(
                child: Semantics(
                  label:
                      '${localizations.formatDecimal(day)}, ${localizations.formatFullDate(dayToBuild)}',
                  selected: isSelectedDay,
                  sortKey: OrdinalSortKey(day.toDouble()),
                  child: ExcludeSemantics(
                    child: Text(
                      localizations.formatDecimal(day),
                      style: itemStyle,
                    ),
                  ),
                ),
              ),
            );

        dayWidget = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            bool allow = true;

            if (disabled) {
              allow = false;
            } else if ((dayToBuild.isAtSameMomentAs(firstDate) ||
                    dayToBuild.isAfter(firstDate)) &&
                (dayToBuild.isAtSameMomentAs(lastDate) ||
                    dayToBuild.isBefore(lastDate))) {
              allow = true;
            } else {
              allow = false;
            }

            if (onTapDay != null) {
              allow = onTapDay(dayToBuild, !disabled);
            }

            if (allow) {
              onChanged(dayToBuild);
            }
          },
          child: dayWidget,
          dragStartBehavior: dragStartBehavior,
        );

        labels.add(dayWidget);
      }
    }

    String monthYearHeader = "";
    if (era == EraMode.BUDDHIST_YEAR) {
      monthYearHeader = localizations.formatMonthYear(displayedMonth);
      monthYearHeader = monthYearHeader.replaceAll(RegExp("\\d"), "");
      monthYearHeader = monthYearHeader.replaceAll("ค.ศ.", "");
      monthYearHeader =
          "$monthYearHeader ${calculateYearEra(era, displayedMonth.year)}"
              .replaceAll(RegExp("  "), " ");
    } else {
      monthYearHeader = localizations.formatMonthYear(displayedMonth);
    }

    return Padding(
      padding: style?.paddingDatePicker ??
          EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: style?.backgroundHeaderMonth,
                borderRadius: orientation == Orientation.landscape
                    ? BorderRadius.only(topRight: Radius.circular(borderRadius))
                    : null),
            padding: style?.paddingMonthHeader,
            child: Center(
              child: ExcludeSemantics(
                child: Text(
                  monthYearHeader,
                  style: style?.textStyleMonthYearHeader ??
                      themeData.textTheme.subtitle1.copyWith(
                        fontFamily: fontFamily,
                      ),
                ),
              ),
            ),
          ),
          Flexible(
            child: GridView.custom(
              gridDelegate: _kDayPickerGridDelegate,
              childrenDelegate: SliverChildListDelegate(
                labels,
                addRepaintBoundaries: false,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
