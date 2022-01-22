import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './beer.dart';

class Beers with ChangeNotifier {
  List<Beer> _items = [];

  Future<void> fetchBeers() async {
    final url = Uri.parse('http://63.34.131.68/api-mobile/beers');
    try {
      final response = await http.get(url);

      final extractedData =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      final results = extractedData['results'];

      final List<Beer> loadedBeers = [];

      for (var i = 0; i < results.length; i++) {
        loadedBeers.add(
          Beer(
            id: results[i]['id'],
            name: results[i]['name'],
            code: results[i]['code'],
            description: results[i]['description'],
            alcohol: results[i]['alcohol'],
            producer: results[i]['manufactured_by']['name'],
            type: ['IPA', 'APA'],
            rating: results[i]['rating'],
            numberOfVotes: results[i]['rating_count'],
            imageUrl: results[i]['thumbnail'],
          ),
        );
      }
      _items = loadedBeers;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<Beer> get items {
    return [..._items];
  }

  Beer findById(String id) {
    return _items.firstWhere((beer) => beer.id.toString() == id);
  }
}
