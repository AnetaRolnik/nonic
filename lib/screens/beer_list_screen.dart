import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/beer_list_item.dart';

class BeerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final beerName = DUMMY_BEERS.map((beer) {
      return beer.name;
    }).toList();

    final beerImg = DUMMY_BEERS.map((beer) {
      return beer.imageUrl;
    }).toList();

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
          itemCount: DUMMY_BEERS.length,
          itemBuilder: (ctx, i) {
            return BeerListItem(beerImg[i], beerName[i]);
          },
        ),
      ),
    );
  }
}
