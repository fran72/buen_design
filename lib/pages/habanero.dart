import 'package:flutter/material.dart';

class HabaneroPage extends StatelessWidget {
  const HabaneroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloques azules')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          // calculamos la alpha según el index
          // empieza en 1.0 y va bajando hasta 0.2
          final alpha = 1.0 - (index * 0.04).clamp(0.0, 0.8);

          // aplicamos el alpha con withValues (nuevo método de Flutter 3.24)
          final color = Colors.blue.withValues(alpha: alpha);

          return Container(
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              'Bloque ${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
