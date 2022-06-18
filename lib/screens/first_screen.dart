import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class UserCalendar extends StatefulWidget {
  @override
  _UserCalendarState createState() => _UserCalendarState();
}

class _UserCalendarState extends State<UserCalendar> {
  static String noEventText = "No event here";
  String calendarText = noEventText;
  DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    _markedDateMap.add(
        DateTime(2022, 6, 09),
        Event(
          date: DateTime(2022, 6, 09),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        DateTime(2022, 6, 13),
        Event(
          date: DateTime(2022, 6, 13),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(DateTime(2022, 6, 15), [
      Event(
        date: DateTime(2022, 6, 15),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2022, 6, 15),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2022, 6, 15),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Календарь'),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Card(
              child: CalendarCarousel(
            selectedDateTime: _currentDate,
            weekendTextStyle: const TextStyle(
              color: Colors.red,
            ),
            weekFormat: false,
            selectedDayBorderColor: Colors.grey,
            markedDatesMap: _markedDateMap,
            selectedDayButtonColor: Colors.grey,
            selectedDayTextStyle: const TextStyle(color: Colors.black),
            todayBorderColor: Colors.transparent,
            weekdayTextStyle: const TextStyle(color: Colors.black),
            height: 420.0,
            daysHaveCircularBorder: true,
            todayButtonColor: Colors.grey,
            locale: 'RUS',
            onDayPressed: (DateTime date, List<Event> events) {
              this.setState(() => refresh(date));
            },
          )),
          Card(
              child: Container(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      child: Center(
                          child: Text(
                        calendarText,
                      )))))
        ])));
  }

  void refresh(DateTime date) {
    _currentDate = date;
    print('selected date ' +
        date.day.toString() +
        date.month.toString() +
        date.year.toString() +
        ' ' +
        date.toString());
    if (_markedDateMap
        .getEvents(DateTime(date.year, date.month, date.day))
        .isNotEmpty) {
    } else {
      calendarText = noEventText;
    }
  }
}

EventList<Event> _markedDateMap = EventList<Event>(events: {
  DateTime(2022, 6, 24): [
    Event(
      date: DateTime(2022, 6, 24),
      title: 'встреча ',
      icon: _eventIcon,
    )
  ]
});

Widget _eventIcon = Container(
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(1000)),
      border: Border.all(color: Colors.grey, width: 2.0)),
  child: Icon(
    Icons.person,
    color: Colors.amber,
  ),
);
