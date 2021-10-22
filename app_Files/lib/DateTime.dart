// ignore_for_file: unused_import, file_names, prefer_const_constructors, annotate_overrides, use_key_in_widget_constructors, prefer_final_fields, prefer_typing_uninitialized_variables, unnecessary_const, curly_braces_in_flow_control_structures

import 'package:eventour/Summary.dart';
import 'FadeAnimation.dart';
import 'package:eventour/Home.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

var finalSelectedDay, finalSelectedTime, finalPeople = '200';
List<String> FinalSubServices = [];

class DateAndTime extends StatefulWidget {
  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  int _selectedDay = 2;
  String _selectedHour = '13:30';
  List<int> _selectedExteraCleaning = [];

  ItemScrollController _scrollController = ItemScrollController();

  final List<dynamic> _days = [
    [1, 'Fri'],
    [2, 'Sat'],
    [3, 'Sun'],
    [4, 'Mon'],
    [5, 'Tue'],
    [6, 'Wed'],
    [7, 'Thu'],
    [8, 'Fri'],
    [9, 'Sat'],
    [10, 'Sun'],
    [11, 'Mon'],
    [12, 'Tue'],
    [13, 'Wed'],
    [14, 'Thu'],
    [15, 'Fri'],
    [16, 'Sat'],
    [17, 'Sun'],
    [18, 'Mon'],
    [19, 'Tue'],
    [20, 'Wed'],
    [21, 'Thu'],
    [22, 'Fri'],
    [23, 'Sat'],
    [24, 'Sun'],
    [25, 'Mon'],
    [26, 'Tue'],
    [27, 'Wed'],
    [28, 'Thu'],
    [29, 'Fri'],
    [30, 'Sat'],
    [31, 'Sun']
  ];

  final List<String> _hours = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  final List<String> _location = [
    'No repeat',
    'Every day',
    'Every week',
    'Every month'
  ];

  final List<dynamic> _exteraCleaning = [
    ['Extra Staff', 'https://img.icons8.com/fluency/48/000000/staff.png', 2500],
    [
      'Full Nighter',
      'https://img.icons8.com/plasticine/100/000000/partly-cloudy-night.png',
      8000
    ],
    [
      'Swings',
      'https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-swings-kindergarten-wanicon-lineal-color-wanicon.png',
      3000
    ],
    [
      'Rifle Shooting',
      'https://img.icons8.com/color/96/000000/sniper-rifle.png',
      2000
    ],
    [
      'Swimming Pool',
      'https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-swimming-pool-sport-wanicon-lineal-color-wanicon.png',
      120000
    ],
  ];

  List<int> _ExtraSelectedServices = [];
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
        index: 24,
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Summary(),
              ),
            );
          },
          label: Text('Proceed'),
          icon: Icon(Icons.arrow_forward_ios),
          hoverColor: Colors.lightBlueAccent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.only(top: 80.0, right: 20.0, left: 20.0),
                  child: Text(
                    'Select Date,Time and Guests',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ))
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                      1.4,
                      Text(
                        "Number of Guests:-",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.runtimeType != int)
                        return 'Please enter valid Guests!!!';
                      else {
                        finalPeople = value;
                      }
                      // ignore: unnecessary_statements
                    },
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: Colors.redAccent),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      labelText: 'Enter Here...',
                      hintText: 'Guest Counter',
                      prefixIcon: const Icon(
                        Icons.people,
                        color: Colors.blueAccent,
                      ),
                    ),
                    onSaved: (value) => finalPeople = value!,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1,
                      Row(
                        children: [
                          Text("October 2021"),
                          Spacer(),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: Colors.grey.shade700,
                            ),
                          )
                        ],
                      )),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border:
                          Border.all(width: 1.5, color: Colors.grey.shade200),
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _days.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FadeAnimation(
                              (1 + index) / 6,
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedDay = _days[index][0];
                                    finalSelectedDay = _selectedDay;
                                    print(finalSelectedDay);
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: 62,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: _selectedDay == _days[index][0]
                                        ? Colors.blue.shade100.withOpacity(0.5)
                                        : Colors.blue.withOpacity(0),
                                    border: Border.all(
                                      color: _selectedDay == _days[index][0]
                                          ? Colors.blue
                                          : Colors.white.withOpacity(0),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _days[index][0].toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        _days[index][1],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.2,
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                              width: 1.5, color: Colors.grey.shade200),
                        ),
                        child: ScrollablePositionedList.builder(
                            itemScrollController: _scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: _hours.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedHour = _hours[index];
                                    finalSelectedTime = _selectedHour;
                                    print(finalSelectedTime);
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: _selectedHour == _hours[index]
                                        ? Colors.orange.shade100
                                            .withOpacity(0.5)
                                        : Colors.orange.withOpacity(0),
                                    border: Border.all(
                                      color: _selectedHour == _hours[index]
                                          ? Colors.orange
                                          : Colors.white.withOpacity(0),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _hours[index],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  FadeAnimation(
                      1.4,
                      Text(
                        "Additional Service",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _exteraCleaning.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_selectedExteraCleaning.contains(index)) {
                                    _selectedExteraCleaning.remove(index);
                                    _ExtraSelectedServices.remove(index);
                                  } else {
                                    _selectedExteraCleaning.add(index);
                                    _ExtraSelectedServices.add(index);
                                  }
                                  int i = 0, j;
                                  while (i < _ExtraSelectedServices.length) {
                                    FinalSubServices.add(_exteraCleaning[
                                        _ExtraSelectedServices[i]][0]);
                                    i++;
                                  }
                                  FinalSubServices =
                                      FinalSubServices.toSet().toList();
                                  print(FinalSubServices);
                                });
                              },
                              child: FadeAnimation(
                                  (1.4 + index) / 4,
                                  Container(
                                      width: 110,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: _selectedExteraCleaning
                                                .contains(index)
                                            ? Colors.blue.shade400
                                            : Colors.transparent,
                                      ),
                                      margin: EdgeInsets.only(right: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            _exteraCleaning[index][1],
                                            height: 40,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            _exteraCleaning[index][0],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: _selectedExteraCleaning
                                                        .contains(index)
                                                    ? Colors.white
                                                    : Colors.grey.shade800),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "+${_exteraCleaning[index][2]} ₹",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      ))));
                        },
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
