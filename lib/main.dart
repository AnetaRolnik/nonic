import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/beer_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nonic App',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          Color.fromRGBO(0, 106, 78, 1).value,
          {
            50: Color.fromRGBO(0, 106, 78, 0.05),
            100: Color.fromRGBO(0, 106, 78, 0.1),
            200: Color.fromRGBO(0, 106, 78, 0.2),
            300: Color.fromRGBO(0, 106, 78, 0.3),
            400: Color.fromRGBO(0, 106, 78, 0.4),
            500: Color.fromRGBO(0, 106, 78, 0.5),
            600: Color.fromRGBO(0, 106, 78, 0.6),
            700: Color.fromRGBO(0, 106, 78, 0.7),
            800: Color.fromRGBO(0, 106, 78, 0.8),
            900: Color.fromRGBO(0, 106, 78, 0.9),
          },
        ),
        fontFamily: 'NotoSans',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      home: BeerListScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'NONIC APP',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
