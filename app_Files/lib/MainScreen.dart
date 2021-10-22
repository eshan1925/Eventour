// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'service.dart';
import 'package:eventour/FadeAnimation.dart';
import 'LoginScreen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'Main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Service> services = [
    Service('Marriage',
        'https://img.icons8.com/external-vitaliy-gorbachev-lineal-color-vitaly-gorbachev/50/000000/external-marriage-love-vitaliy-gorbachev-lineal-color-vitaly-gorbachev.png'),
    Service('Birthday',
        'https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-birthday-birthday-and-party-wanicon-lineal-color-wanicon.png'),
    Service('Engagement',
        'https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-engagement-valentines-day-flatart-icons-lineal-color-flatarticons.png'),
    Service('Feast', 'https://img.icons8.com/color/48/000000/feast.png'),
    Service('Festive Parties',
        'https://img.icons8.com/external-tulpahn-outline-color-tulpahn/64/000000/external-festival-new-year-tulpahn-outline-color-tulpahn.png'),
    Service('Cruise Party',
        'https://img.icons8.com/doodle/48/000000/cruise-ship--v1.png'),
    Service('Anniversary',
        'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/58/000000/external-marriage-love-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Christmas Party',
        'https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-christmas-gift-box-wanicon-lineal-color-wanicon.png'),
    Service('New Year',
        'https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-happy-new-year-happy-new-year-wanicon-lineal-color-wanicon.png'),
  ];

  int selectedService = 4;
  @override
  void initState() {
    // Randomly select from service list every 2 seconds
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        selectedService = Random().nextInt(services.length);
      });
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 90,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(
                    (1.0 + index) / 4,
                    serviceContainer(
                        services[index].imageURL, services[index].name, index));
              }),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Center(
                        child: Text(
                          'Easy, reliable way to book \nyour event anywhere',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Center(
                        child: Text(
                          'We provide you with the best way to book your event in 5 easy steps.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    )),
                FadeAnimation(
                  1.5,
                  Padding(
                    padding: EdgeInsets.all(50.0),
                    child: MaterialButton(
                      elevation: 0,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      height: 55,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.white : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue.shade100
                : Colors.grey.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 30),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 10),
              )
            ]),
      ),
    );
  }
}
