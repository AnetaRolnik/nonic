import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/beers.dart';

class BeerDetailScreen extends StatelessWidget {
  static const routeName = '/beer';

  @override
  Widget build(BuildContext context) {
    final beerId = ModalRoute.of(context).settings.arguments.toString();
    final loadedBeer = Provider.of<Beers>(context, listen: false).findById(beerId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedBeer.name),
      ),
      body: Center(
        child: Text('Details'),
      ),
    );
  }
}
