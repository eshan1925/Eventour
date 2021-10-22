import 'package:flutter/material.dart';
import 'sheets.dart';
import 'package:eventour/MainScreen.dart';
import 'LoginScreen.dart';
import 'select_service.dart';
import 'Home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventour',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      routes: <String, WidgetBuilder>{
        HomePage.id: (context) => HomePage(),
        MainScreen.id: (context) => MainScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SelectService.id: (context) => SelectService(),
      },
    );
  }
}
