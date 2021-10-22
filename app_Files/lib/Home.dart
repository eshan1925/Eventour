// ignore_for_file: file_names, prefer_const_constructors

import 'FadeAnimation.dart';
import 'service.dart';
import 'package:flutter/material.dart';
import 'hotels.dart';

class HomePage extends StatefulWidget {
  static const String id = 'Home_screen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  ];

  List<dynamic> workers = [
    ['The Royal Arcs', 'Kanpur', 'images/download.jpg', 4.8],
    ['Hotel Grand maze', 'Lucknow', 'images/maze.jpg', 4.6],
    ['Deepak Caters', 'Delhi', 'images/deepak.jpg', 4.4]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Hotels(),
              ),
            );
          },
          label: Text('Explore More'),
          icon: Icon(Icons.search),
          hoverColor: Colors.lightBlueAccent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Dashboard',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.accessibility_new_rounded,
                  color: Colors.grey.shade700,
                  size: 30,
                )),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications_none,
                color: Colors.grey.shade700,
                size: 30,
              ),
            )
          ],
          // leading: GestureDetector(
          //     onTap: () {
          //       Navigator.pushNamed(context, '/login');
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: CircleAvatar(
          //         backgroundImage: NetworkImage(
          //             'https://uifaces.co/our-content/donated/NY9hnAbp.jpg'),
          //       ),
          //     )),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                        ))
                  ],
                ),
              )),
          FadeAnimation(
              1.2,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(
                      color: Colors.grey.shade500,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade50,
                        offset: Offset(0, 4),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                'images/download.jpg',
                                width: 70,
                                height: 55,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "The Royal Arcs",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Occasion - Birthday Party",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // // ignore: deprecated_member_use
                      // FlatButton(
                      //   height: 10,
                      //   color: Colors.blue,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15.0),
                      //   ),
                      //   onPressed: null,
                      //   child: Center(
                      //       child: Text(
                      //     'View Order',
                      //     style: TextStyle(color: Colors.white, fontSize: 18),
                      //   )),
                      // )
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          FadeAnimation(
              1.3,
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                        ))
                  ],
                ),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 300,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
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
          SizedBox(
            height: 20,
          ),
          FadeAnimation(
              1.3,
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Rated',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                        ))
                  ],
                ),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: workers.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation(
                      (1.0 + index) / 4,
                      workerContainer(workers[index][0], workers[index][1],
                          workers[index][2], workers[index][3]));
                }),
          ),
          SizedBox(
            height: 150,
          ),
        ])));
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(
            color: Colors.grey.shade500,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 45),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 10),
              )
            ]),
      ),
    );
  }

  workerContainer(String name, String job, String image, double rating) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 3.5,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade500,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(image)),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      job,
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      rating.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 20,
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Hello, There!',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('images/cover.jpeg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About Us'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
