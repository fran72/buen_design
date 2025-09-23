import 'package:buen_design/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class Rome2rio extends StatelessWidget {
  const Rome2rio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rome2rio Page')),
      drawer: menuDrawer(context),
      body: Center(child: Text(' ROME2RIO')),
    );
  }
}
