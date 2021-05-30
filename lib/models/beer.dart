import 'package:flutter/material.dart';

class Beer {
  @required final String id;
  @required final String name;
  @required final String producer;
  @required final List<String> type;
  @required final double alcohol;
  @required final String barcode;
  @required final double rating;
  @required final int numberOfVotes;
  @required final String imageUrl;
  @required final String description;

  const Beer({
    this.id,
    this.name,
    this.producer,
    this.type,
    this.alcohol,
    this.barcode,
    this.rating,
    this.numberOfVotes,
    this.imageUrl,
    this.description,
  });
}
