import 'package:flutter/material.dart';

class BeerDetailScreen extends StatelessWidget {
  static const routeName = '/beer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name'),
      ),
      body: Center(
        child: Text('Details'),
      ),
    );
  }
}
