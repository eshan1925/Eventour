// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_new, prefer_typing_uninitialized_variables

import 'package:eventour/HotlelModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'select_service.dart';

var selectedHotelName;
var selectedRates;

class Hotels extends StatefulWidget {
  @override
  _HotelsState createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  List<HotelModel> hoteldata = <HotelModel>[];
  Future<List<HotelModel>> getHotelData() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbx4oTQhoCWhsEXzHECSj3i1qbq6bvTi8XKcWG96gj6_tvbtEYnSxv8BlFSRVr74aoXz/exec"));
    var jsonHotel = convert.jsonDecode(raw.body);
    print("this is json Feedback $jsonHotel");

    jsonHotel.forEach((element) {
      print('$element \n\n');
      HotelModel hotelModel = new HotelModel(
          NameofOwner: 'ss',
          designation: 'ss',
          CompanyName: 'ss',
          location: 'ss',
          email: 'ss',
          rates: 134);
      hotelModel.CompanyName = element["company_name"];
      hotelModel.NameofOwner = element["contact_person"];
      hotelModel.location = element["location"];
      hotelModel.email = element["email"];
      hotelModel.rates = element["rate"];
      hotelModel.designation = element["designation"];

      hoteldata.add(hotelModel);
    });
    return hoteldata;
    // print(hoteldata);
    // hoteldata = jsonHotel.map((json)=>HotelModel.fromJson(json));
  }

  @override
  void initState() {
    getHotelData();
    super.initState();
  }

  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HotelModel>>(
        future: getHotelData(),
        builder: (context, snapshot) {
          final hoteldata = snapshot.data ?? [];
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectService(),
                  ),
                );
              },
            ),
            appBar: AppBar(
              title: Text('Hotel Selection'),
              elevation: 2,
              centerTitle: true,
            ),
            body: Container(
                child: (hoteldata != null)
                    ? ListView.builder(
                        controller: _controller,
                        itemCount: hoteldata.length,
                        itemBuilder: (context, index) {
                          return HotelData(
                              NameofOwner: hoteldata[index].NameofOwner,
                              designation: hoteldata[index].designation,
                              CompanyName: hoteldata[index].CompanyName,
                              location: hoteldata[index].location,
                              email: hoteldata[index].email,
                              rates: hoteldata[index].rates);
                        })
                    : Center(
                        child: CircularProgressIndicator(
                        color: Colors.blue,
                      ))),
          );
        });
  }
}

class HotelData extends StatefulWidget {
  final String NameofOwner;
  final String designation;
  final String CompanyName;
  final String location;
  final String email;
  final int rates;
  HotelData(
      {required this.NameofOwner,
      required this.designation,
      required this.CompanyName,
      required this.location,
      required this.email,
      required this.rates});

  @override
  State<HotelData> createState() => _HotelDataState();
}

class _HotelDataState extends State<HotelData> {
  bool _flag = true;
  Color boxColor = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlueAccent),
            color: boxColor,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      widget.CompanyName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(widget.location),
                  ),
                  Container(
                    child: Text(
                      widget.NameofOwner,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text("(${widget.designation})"),
                  ),
                  Container(
                    child: Text("Contact Here-: ${widget.email}"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Rs. ${widget.rates.toString()} /-",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() {
                          _flag = !_flag;
                          selectedHotelName = widget.CompanyName;
                          selectedRates = widget.rates;
                        }),
                        child: Text(_flag ? 'Select' : 'Selected ✓'),
                        style: ElevatedButton.styleFrom(
                          primary: _flag
                              ? Colors.blue
                              : Colors.green, // This is what you need!
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
