import 'package:buen_design/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Home')),
      drawer: menuDrawer(context),
      body: Center(child: Text(' HOME')),
    );
  }
}
