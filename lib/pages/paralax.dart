import 'package:flutter/material.dart';

class ParallaxPage extends StatelessWidget {
  const ParallaxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Efecto Parallax'),
              background: Image.network(
                'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item #$index'),
                subtitle: const Text('Scroll para ver el parallax'),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
