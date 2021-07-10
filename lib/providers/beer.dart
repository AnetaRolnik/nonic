import 'package:flutter/material.dart';

class Beer with ChangeNotifier {
  final String id;
  final String name;
  final String producer;
  final List<String> type;
  final double alcohol;
  final String barcode;
  final double rating;
  final int numberOfVotes;
  final String imageUrl;
  final String description;

  Beer({
    @required this.id,
    @required this.name,
    @required this.producer,
    @required this.type,
    @required this.alcohol,
    @required this.barcode,
    @required this.rating,
    @required this.numberOfVotes,
    @required this.imageUrl,
    @required this.description,
  });
}
