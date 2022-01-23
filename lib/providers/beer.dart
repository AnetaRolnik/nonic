import 'package:flutter/material.dart';

class Beer with ChangeNotifier {
  final int id;
  final String name;
  final String code;
  final String producer;
  final double alcohol;
  final List<String> type;
  final String description;
  final int rating;
  final int numberOfVotes;
  final String imageUrl;

  Beer({
    @required this.id,
    @required this.name,
    @required this.code,
    @required this.producer,
    @required this.alcohol,
    @required this.type,
    @required this.description,
    @required this.rating,
    @required this.numberOfVotes,
    @required this.imageUrl,
  });
}
