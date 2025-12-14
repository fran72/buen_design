import 'package:flutter/material.dart';

class SliversPage extends StatelessWidget {
  const SliversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.red,
            expandedHeight: 200, // importante para que se vea el efecto
            // pinned: true, // para que se quede fijo arriba
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('data'),
              background: Image.asset(
                'assets/images/rio_fraile.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.red,
            expandedHeight: 200, // importante para que se vea el efecto
            pinned: true, // para que se quede fijo arriba
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('data'),
              background: Image.asset(
                'assets/images/rio_fraile.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item $index')),
              childCount: 10, // contenido para hacer scroll
            ),
          ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('texto de titulo'), Text('texto de subtitulo')],
            ),
          ),
        ],
      ),
    );
  }
}
