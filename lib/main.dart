import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './providers/beers.dart';
import './screens/beer_list_screen.dart';
import './screens/beer_detail_screen.dart';

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
    return ChangeNotifierProvider(
      create: (_) => Beers(),
      child: MaterialApp(
        title: 'Nonic App',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(254, 198, 0, 1),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color.fromRGBO(114, 114, 144, 1),
          ),
          fontFamily: 'NotoSans',
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline2: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline6: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyText1: const TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            )
          ),
        ),
        home: BeerListScreen(),
        routes: {
          BeerDetailScreen.routeName: (ctx) => BeerDetailScreen(),
        },
      ),
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
