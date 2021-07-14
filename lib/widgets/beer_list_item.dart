import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/beer.dart';
import '../screens/beer_detail_screen.dart';

class BeerListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final beer = Provider.of<Beer>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          BeerDetailScreen.routeName,
          arguments: beer.id,
        );
      },
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: BgClipper(),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, -2.0),
            child: Image.asset(
              beer.imageUrl,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.85),
            child: Text(beer.name, style: Theme.of(context).textTheme.headline6),
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
