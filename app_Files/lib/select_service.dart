// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'FadeAnimation.dart';
import 'service.dart';
import 'package:flutter/material.dart';
import 'services.dart';

var userSelectedService;

class SelectService extends StatefulWidget {
  static const String id = 'Select_Service';
  const SelectService({Key? key}) : super(key: key);

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
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
    Service('Random Party',
        'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/58/000000/external-party-carnival-sbts2018-lineal-color-sbts2018.png'),
  ];

  List<String> listOfServices = [
    'Marriage',
    'Birthday',
    'Engagement',
    'Feast',
    'Festive Parties',
    'Cruise Party',
    'Anniversary',
    'Christmas Party',
    'New Year',
    'Random Party',
  ];
  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: selectedService >= 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CleaningPage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                backgroundColor: Colors.blue,
              )
            : null,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: FadeAnimation(
                1.2,
                Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                  child: Text(
                    "What is the \nEvent's occasion?",
                    style: TextStyle(
                      fontSize: 40,
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: services.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FadeAnimation(
                              (1.0 + index) / 4,
                              serviceContainer(services[index].imageURL,
                                  services[index].name, index));
                        }),
                  ),
                ]),
          ),
        ));
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
          userSelectedService = listOfServices[selectedService];
          print(userSelectedService);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 80),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              )
            ]),
      ),
    );
  }
}
