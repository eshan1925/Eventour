// ignore_for_file: prefer_final_fields, prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:eventour/FadeAnimation.dart';
import 'DateTime.dart';

List<String> finalSubServices = [];

class CleaningPage extends StatefulWidget {
  @override
  _CleaningPageState createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
  List<dynamic> _rooms = [
    [
      'Catering and Food',
      'https://img.icons8.com/external-flatart-icons-flat-flatarticons/64/000000/external-catering-party-flatart-icons-flat-flatarticons.png',
      Colors.red,
      0
    ],
    [
      'Flower Decorations',
      'https://img.icons8.com/doodle/48/000000/flower--v1.png',
      Colors.orange,
      1
    ],
    [
      'Balloon Decorations',
      'https://img.icons8.com/external-justicon-lineal-color-justicon/64/000000/external-balloon-new-years-eve-justicon-lineal-color-justicon.png',
      Colors.blue,
      1
    ],
    [
      'Bar',
      'https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-bar-tropical-wanicon-lineal-color-wanicon.png',
      Colors.purple,
      0
    ],
    [
      'Accommodation',
      'https://img.icons8.com/fluency/48/000000/3-star-hotel.png',
      Colors.green,
      0
    ]
  ];

  List<int> _selectedRooms = [];
  List<String> subServices = [
    'Catering and Food',
    'Flower Decorations',
    'Balloon Decorations',
    'Bar',
    'Accommodation'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: _selectedRooms.length > 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DateAndTime()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${_selectedRooms.length}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ],
                ),
                backgroundColor: Colors.blue,
              )
            : null,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                  child: Text(
                    'What are the \nservices you require?',
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
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _rooms.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation(
                      (1.2 + index) / 4, room(_rooms[index], index));
                }),
          ),
        ));
  }

  room(List room, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedRooms.contains(index))
            _selectedRooms.remove(index);
          else
            _selectedRooms.add(index);

          int i = 0;
          while (i < _selectedRooms.length) {
            finalSubServices.add(subServices[_selectedRooms[i]]);
            finalSubServices = finalSubServices.toSet().toList();
            i++;
          }
          print(finalSubServices.toString());
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: _selectedRooms.contains(index)
                ? room[2].shade50.withOpacity(0.5)
                : Colors.grey.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Image.network(
                        room[1],
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        room[0],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  _selectedRooms.contains(index)
                      ? Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade100.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 20,
                          ))
                      : SizedBox()
                ],
              ),
              // (_selectedRooms.contains(index) && room[3] >= 1)
              //     ? Container(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             SizedBox(
              //               height: 20.0,
              //             ),
              //             Text(
              //               "How many ${room[0]}s?",
              //               style: TextStyle(fontSize: 15),
              //             ),
              //             SizedBox(
              //               height: 10.0,
              //             ),
              //             Container(
              //               height: 45,
              //               child: ListView.builder(
              //                   scrollDirection: Axis.horizontal,
              //                   itemCount: 4,
              //                   itemBuilder: (BuildContext context, int index) {
              //                     return GestureDetector(
              //                       onTap: () {
              //                         setState(() {
              //                           room[3] = index + 1;
              //                         });
              //                       },
              //                       child: Container(
              //                         margin: EdgeInsets.only(right: 10.0),
              //                         padding: EdgeInsets.all(10.0),
              //                         width: 50,
              //                         decoration: BoxDecoration(
              //                           borderRadius:
              //                               BorderRadius.circular(10.0),
              //                           color: room[3] == index + 1
              //                               ? room[2].withOpacity(0.5)
              //                               : room[2].shade200.withOpacity(0.5),
              //                         ),
              //                         child: Center(
              //                             child: Text(
              //                           (index + 1).toString(),
              //                           style: TextStyle(
              //                               fontSize: 22, color: Colors.white),
              //                         )),
              //                       ),
              //                     );
              //                   }),
              //             )
              //           ],
              //         ),
              //       )
              //     : SizedBox()
            ],
          )),
    );
  }
}
