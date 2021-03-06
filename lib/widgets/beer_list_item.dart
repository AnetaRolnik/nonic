import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/beers.dart';
import '../providers/beer.dart';
import '../screens/beer_detail_screen.dart';

class BeerListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final beer = Provider.of<Beer>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Provider.of<Beers>(context, listen: false).fetchBeerDetails(beer.code);
        Navigator.of(context).pushNamed(BeerDetailScreen.routeName);
      },
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: BgClipper(),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -2.0),
            child: beer.imageUrl != null
                ? Image.network(
                    beer.imageUrl,
                    height: 200,
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    'assets/images/beers/b1.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child:
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text(beer.name, style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center,),
                ),
          ),
        ],
      ),
    );
  }
}

class BgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 30;

    clippedPath.moveTo(0, size.height * 0.6);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.45);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
