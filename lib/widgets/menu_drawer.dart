import 'package:flutter/material.dart';

Drawer menuDrawer(BuildContext context) {
  final List<dynamic> pages = [
    {'icon': Icons.home, 'text': 'Inicio', 'route': 'home'},
    {'icon': Icons.map, 'text': 'Moncofar', 'route': 'moncofar'},
    {'icon': Icons.map, 'text': 'Carrito', 'route': 'carrito'},
    {'icon': Icons.map, 'text': 'Scancal', 'route': 'scan_cal'},
    {'icon': Icons.map, 'text': 'Habanero', 'route': 'habanero'},
    {'icon': Icons.map, 'text': 'Caixa', 'route': 'caixa'},
    {'icon': Icons.map, 'text': 'Paralax', 'route': 'paralax'},
    {'icon': Icons.map, 'text': 'Slivers franfolio', 'route': 'slivers'},
    {'icon': Icons.map, 'text': 'Adeslas', 'route': 'adeslas'},
    {'icon': Icons.map, 'text': 'CityXerpa', 'route': 'cityxerpa'},
    {'icon': Icons.map, 'text': 'ParalaxAdv', 'route': 'paralax_adv'},
    {
      'icon': Icons.map,
      'text': 'Carrito Wallapop',
      'route': 'carrito_wallapop',
    },
  ];
  return Drawer(
    child: ListView.builder(
      itemCount: pages.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(pages[index]['icon']),
        title: Text(pages[index]['text']),
        onTap: () {
          Navigator.pushNamed(context, pages[index]['route']);
        },
      ),
    ),
  );
}
