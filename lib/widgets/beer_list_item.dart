import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/beer.dart';
import '../screens/beer_detail_screen.dart';

class BeerListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final beer = Provider.of<Beer>(context, listen: false);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(5),
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              BeerDetailScreen.routeName,
              arguments: beer.id,
            );
          },
          child: Column(
            children: [
              Text(
                beer.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      beer.imageUrl,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
