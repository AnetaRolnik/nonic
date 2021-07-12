import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/beers.dart';

class BeerDetailScreen extends StatelessWidget {
  static const routeName = '/beer';

  @override
  Widget build(BuildContext context) {
    final beerId = ModalRoute.of(context).settings.arguments.toString();
    final loadedBeer =
        Provider.of<Beers>(context, listen: false).findById(beerId);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            loadedBeer.imageUrl,
            height: 270,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            loadedBeer.name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        SizedBox(width: 5),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined),
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Wrap(
                      children: loadedBeer.type
                          .map((type) => Container(
                                margin: EdgeInsets.only(right: 3, bottom: 5),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 3,
                                  ),
                                  child: Text(
                                    type,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Icon(Icons.star, color: Theme.of(context).primaryColor),
                        Icon(Icons.star, color: Theme.of(context).primaryColor),
                        Icon(Icons.star, color: Theme.of(context).primaryColor),
                        Icon(Icons.star, color: Theme.of(context).primaryColor),
                        Icon(Icons.star_border,
                            color: Theme.of(context).primaryColor),
                        SizedBox(width: 7),
                        Text(
                          (loadedBeer.rating).toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(width: 5),
                        Text('(${loadedBeer.numberOfVotes} głosów)'),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Alkohol: ${loadedBeer.alcohol}%',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Producent: ${loadedBeer.producer}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 15),
                    Text(
                      loadedBeer.description,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
