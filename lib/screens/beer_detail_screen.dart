import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/beers.dart';

class BeerDetailScreen extends StatelessWidget {
  static const routeName = '/beer';

  @override
  Widget build(BuildContext context) {
    final beers = Provider.of<Beers>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          beers.details[0].imageUrl != null
              ? Image.network(
            beers.details[0].imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  'assets/images/beers/b1.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              width: double.infinity,
              decoration: const BoxDecoration(
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
                            beers.details[0].name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border_outlined),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      children: beers.details[0].type
                          .map((type) => Container(
                                margin:
                                    const EdgeInsets.only(right: 3, bottom: 5),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 3,
                                  ),
                                  child: Text(
                                    type,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                        const SizedBox(width: 7),
                        Text(
                          (beers.details[0].rating).toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(width: 5),
                        Text('(${beers.items[0].numberOfVotes} głosów)'),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Alkohol: ${beers.details[0].alcohol}%',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Producent: ${beers.details[0].producer}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      beers.details[0].description,
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
