import 'package:flutter/material.dart';

import '../dummy_data.dart';

class BeerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final beerImg = DUMMY_BEERS.map((beer) {
      return beer.imageUrl;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Nonic'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: DUMMY_BEERS.length,
        itemBuilder: (ctx, i) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    beerImg[i],
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
