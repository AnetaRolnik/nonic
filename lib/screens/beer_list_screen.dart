import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/beers.dart';
import '../widgets/beer_list_item.dart';

class BeerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final beers = Provider.of<Beers>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Nonic',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.3,
        ),
        itemCount: beers.items.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: beers.items[i],
          child: BeerListItem(),
        ),
      ),
    );
  }
}
