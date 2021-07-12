import 'package:flutter/material.dart';

import './beer.dart';

class Beers with ChangeNotifier {
  List<Beer> _items = [
    Beer(
      id: 'b1',
      name: 'Edelmeister Pilsener',
      producer: 'Van Pur',
      type: ['pilsner'],
      alcohol: 4.5,
      barcode: '5900535013153',
      rating: 4.0,
      numberOfVotes: 11,
      imageUrl: 'assets/images/beers/b1.png',
      description: 'Doskonały wybór dla ceniących klasykę, szukających wytrawnego smaku, łagodnej goryczki i szlachetnego chmielowego aromatu, w pięknie klarownym złotym piwie. Tradycyjny pilsener - połączenie jasnego słodu pilzneńskiego, chmielu oraz dobrej jakości wody, bez jakichkolwiek innych dodatków.',
    ),
    Beer(
      id: 'b2',
      name: 'Bestbir Kokosowy',
      producer: 'Browar Staropolski',
      type: ['lager', 'pasteryzowane', 'niefiltrowane'],
      alcohol: 4.7,
      barcode: '5905669086073',
      rating: 3.9,
      numberOfVotes: 155,
      imageUrl: 'assets/images/beers/b2.png',
      description: 'BestBir Kokos - odrobina równikowej egzotyki w serii BestBir. Doskonałe piwo Browaru Staropolskiego połączone z sokiem z orzechów kokosowych.',
    ),
    Beer(
      id: 'b3',
      name: 'Browar Fortuna',
      producer: '',
      type: ['lager', 'pasteryzowane'],
      alcohol: 6.0,
      barcode: '5902709615286',
      rating: 4.2,
      numberOfVotes: 410,
      imageUrl: 'assets/images/beers/b3.png',
      description: 'Tradycyjny europejski Lager, najczęściej warzony na Oktoberfest, będący doskonałą alternatywą dla "jasnego pełnego". Swój pełny, słodowy smak Miłosław Marcowe zawdzięcza połączeniu kilku szlachetnych odmian słodów. Lekka chmielowa goryczka idealnie równoważy słodowość piwa, co sprawia, że Marcowe przyjemnie orzeźwia zmysły. Po nalaniu do pokala piwo tworzy gęstą pianę, która skrywa piękną, złotą barwę.',
    ),
    Beer(
      id: 'b4',
      name: 'Hopito Check My Flow',
      producer: 'Browar Hopito',
      type: ['DDH', 'IPA'],
      alcohol: 6.0,
      barcode: '5903357304690',
      rating: 4.5,
      numberOfVotes: 4,
      imageUrl: 'assets/images/beers/b4.png',
      description: 'Podwójnie chmielone na zimno New England IPA. Piwo z dodatkiem chmieli Galaxy i Sabro, o zawartości alkoholu 6% i ekstrakcie 16°. Check My Flow jest mocno zmętnione, przez co jest soczyste i pełne. Wyczuć możemy wycofaną goryczkę, a balans jest skoncentrowany w kierunku owocowości i słodowości.',
    ),
    Beer(
      id: 'b5',
      name: 'ART.+8 Strawberry Berliner Weisse',
      producer: 'Browar Stu Mostów',
      type: ['niefiltrowane', 'niepasteryzowane'],
      alcohol: 3.8,
      barcode: '5905279213388',
      rating: 4.0,
      numberOfVotes: 287,
      imageUrl: 'assets/images/beers/b5.png',
      description: 'Jest to mix niemieckiej tradycyjnej szkoły piwowarskiej, czyli historyczny styl jasnego, niezwykle lekkiego i orzeźwiającego niemieckiego piwa – Berliner Weisse, fermentowanego z udziałem bakterii kwasu mlekowego, z nowofalowymi niemieckimi chmielami – Comet i Huell Melon oraz sezonowym polskim akcentem – aromatycznymi truskawkami.',
    ),
    Beer(
      id: 'b6',
      name: 'Cornelius Hazy IPA',
      producer: 'Browar Cornelius',
      type: ['IPA', 'niefiltrowane', 'pasteryzowane'],
      alcohol: 6.5,
      barcode: '5905689307431',
      rating: 3.8,
      numberOfVotes: 172,
      imageUrl: 'assets/images/beers/b6.png',
      description: 'Jasne piwo typu mocny Ale w stylu India Pale Ale.',
    ),
    Beer(
      id: 'b7',
      name: 'Podróże Kormorana American IPA',
      producer: 'Browar Kormoran',
      type: ['AIPA', 'niepasteryzowane', 'niefiltrowane'],
      alcohol: 6.0,
      barcode: '5902528443251',
      rating: 4.1,
      numberOfVotes: 614,
      imageUrl: 'assets/images/beers/b7.png',
      description: 'Piwo warzone metodą górnej fermentacji, niefiltrowane, pasteryzowane. Pierwszym skojarzeniem ze stylem AIPA jest feria aromatów. AIPA oszałamia chmielowymi zapachami przywołującymi cytrusy, kwiaty, sosnowy las, czy owoce tropikalne. Barwa mętna, bursztynowa. Piwo pokryte jest trwałą, drobnopęcherzykową pianą.',
    ),
  ];

  List<Beer> get items {
    return [..._items];
  }

  Beer findById(String id) {
    return _items.firstWhere((beer) => beer.id == id);
  }
}
