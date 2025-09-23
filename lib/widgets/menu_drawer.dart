import 'package:flutter/material.dart';

Drawer menuDrawer(BuildContext context) {
  final List<dynamic> pages = [
    {'icon': Icons.home, 'text': 'Inicio', 'route': 'home'},
    {'icon': Icons.map, 'text': 'Rome2rio', 'route': 'rome2rio'},
  ];
  return Drawer(
    child: ListView.builder(
      itemCount: pages.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(pages[index]['icon']),
        title: Text(pages[index]['text']),
        onTap: () {
          Navigator.pushReplacementNamed(context, pages[index]['route']);
        },
      ),
    ),
  );
}
