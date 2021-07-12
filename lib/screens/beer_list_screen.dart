import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/beers.dart';
import '../widgets/beer_list_item.dart';

class BeerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final beers = Provider.of<Beers>(context);

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(9, 48, 40, 1), Color.fromRGBO(35, 122, 87, 1)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Nonic'),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: beers.items.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: beers.items[i],
            child: BeerListItem(),
          ),
        ),
      ),
    );
  }
}
