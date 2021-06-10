import 'package:flutter/material.dart';

class BeerListItem extends StatelessWidget {

  final beerImage;
  final String name;

  BeerListItem(this.beerImage, this.name);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(5),
      child: Container(
        child: Column(
          children: [
            Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    beerImage,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
