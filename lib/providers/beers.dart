import 'package:flutter/material.dart';

import './beer.dart';

class Beers with ChangeNotifier {
  List<Beer> _items = [
    Beer(
      id: 'b1',
      name: 'Cornelius Hazy Banan',
      producer: 'Cornelius',
      type: ['owocowe', 'pszeniczne'],
      alcohol: 3.0,
      barcode: '5905689310646',
      rating: 7.49,
      numberOfVotes: 636,
      imageUrl: 'assets/images/beers/b1.jpg',
      description: 'Prawdziwe piwo pszeniczne - nieklarowne, wzbogacone naturalnym sokiem z banana.',
    ),
    Beer(
      id: 'b2',
      name: 'Bestbir Kokosowy',
      producer: 'Browar Staropolski',
      type: ['lager', 'pasteryzowane', 'niefiltrowane'],
      alcohol: 4.7,
      barcode: '5905669086073',
      rating: 7.44,
      numberOfVotes: 155,
      imageUrl: 'assets/images/beers/b2.png',
      description: 'BestBir Kokos - odrobina równikowej egzotyki w serii BestBir. Doskonałe piwo Browaru Staropolskiego połączone z sokiem z orzechów kokosowych.',
    ),
    Beer(
      id: 'b3',
      name: 'Profesja Profesor',
      producer: 'Browar Profesja',
      type: ['DDH', 'NEIPA', 'IPA', 'pasteryzowane', 'niefiltrowane'],
      alcohol: 6.6,
      barcode: '5904730658805',
      rating: 7.78,
      numberOfVotes: 8,
      imageUrl: 'assets/images/beers/b3.jpg',
      description: 'Klasyczne piwo pszeniczne o delikatnym charakterze. Poprzez aromat świeżych bananów przebija się wyraźna nuta fenoli goździków. Delikatny, lekko chlebowy smak połączony jest z bananową owocowością oraz smakiem goździków. Lekkie nuty chmielowe, niska słodowość oraz średnie wysycenie powodują, iż piwo jest lekkie w odbiorze i orzeźwiające.',
    ),
  ];

  List<Beer> get items {
    return [..._items];
  }

  Beer findById(String id) {
    return _items.firstWhere((beer) => beer.id == id);
  }
}
