// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventour/DateTime.dart';
import 'package:flutter/material.dart';
import 'Orders.dart';
import 'Home.dart';
import 'select_service.dart';
import 'services.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'LoginScreen.dart';
import 'hotels.dart';
import 'DateTime.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  late TwilioFlutter twilioFlutter;
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACd9ad6b8cdf8f81c2c96559f891bd5378',
        authToken: 'ff88b69d5074ae3285785b6824ec5c8d',
        twilioNumber: '+12183095832');
    super.initState();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: UserNum,
        messageBody:
            '\nHey $UserName,\nYou order was Confirmed Successfully.\nOrder Details:\nHotel:$selectedHotelName\nBill:${selectedRates.toString()} \nEvent Name: $userSelectedService\nServices: ${finalSubServices.toString()}\nNumber of People: $finalPeople\nDate: $finalSelectedDay Oct 2021\nTime: $finalSelectedTime\n ExtraServices:${FinalSubServices.toString()}\nThnaks for placing the order😎');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.check),
          label: Text('Confirm Book'),
          onPressed: () {
            gettingOrders();
            sendSms();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 55,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hey There,',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Confirm your booking!!!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Your booking Summary-:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '-> Hotel Name-: $selectedHotelName',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '     Your Event ✨-: $userSelectedService',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '     Your Services -: ${finalSubServices.toString()}',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '     Number of People -: ${finalPeople.toString()}',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '     Date -: $finalSelectedDay Oct 2021',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '   Time -: $finalSelectedTime',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '     Extra Services -: ${FinalSubServices.toString()}',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '________________________________________________',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 160),
                  Center(
                    child: Container(
                      child: Text(
                        'Total Bill-: ₹ ${selectedRates.toString()}/-',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 70,
            // ),
            // SizedBox(
            //   height: 50,
            // ),
            // Lottie.network(
            //   'https://assets5.lottiefiles.com/packages/lf20_x1gt4068.json',
            // ),
          ],
        ),
      ),
    );
  }
}
