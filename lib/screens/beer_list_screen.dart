import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

import '../providers/beers.dart';
import '../widgets/beer_list_item.dart';
import '../screens/beer_detail_screen.dart';

class BeerListScreen extends StatefulWidget {
  @override
  State<BeerListScreen> createState() => _BeerListScreenState();
}

class _BeerListScreenState extends State<BeerListScreen> {
  String barcode = 'Unknown';

  Future<void> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        "#fe6200",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;
      setState(() {
        this.barcode = barcode;
      });
      goToDetail();
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }
  }


  Future<void> goToDetail() async {
    final url =
    Uri.parse('http://63.34.131.68/api-mobile/beers/?code=$barcode');
    print(barcode);
    print(url);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final results = extractedData['results'];
      print(results[0]['id']);
      Navigator.of(context).pushNamed(
        BeerDetailScreen.routeName,
        arguments: results[0]['id'],
      );
    } catch (error) {
      throw (error);
    }
  }

  @override
  void initState() {
    Provider.of<Beers>(context, listen: false).fetchBeers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final beers = Provider.of<Beers>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Kitek',
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: scanBarcode,
      ),
    );
  }
}
