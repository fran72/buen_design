import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ScanCalPage extends StatelessWidget {
  const ScanCalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ScanCal",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.nightlight_round, color: Colors.grey),
                      SizedBox(width: 12),
                      Icon(Icons.calendar_today, color: Colors.grey),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              /// Calendario horizontal
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final today = 6; // ejemplo
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == today
                            ? Colors.blue[50]
                            : Colors.grey[200],
                        border: Border.all(
                          color: index == today
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${index + 3}", // fake numbers
                          style: TextStyle(
                            color: index == today ? Colors.blue : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Chip(
                  label: Text("Viernes, 7 de marzo"),
                  backgroundColor: Color(0xFFF5F5F5),
                ),
              ),

              const SizedBox(height: 24),

              /// Resumen cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _summaryCard("Hoy", "426k", Colors.blue[100]!),
                  _summaryCard("Resumen", "Semanal >", Colors.purple[100]!),
                  _summaryCard("Objetivo", "2136k", Colors.green[100]!),
                ],
              ),

              const SizedBox(height: 24),

              /// Progreso circular y macros
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 8,
                      percent: 0.2,
                      center: const Text("20%\nobjetivo"),
                      progressColor: Colors.blue,
                      backgroundColor: Colors.grey[300]!,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: const [
                          MacroRow(
                            "Proteína",
                            "38/150g",
                            Icons.fitness_center,
                            Colors.blue,
                          ),
                          MacroRow(
                            "Carbohidratos",
                            "30/250g",
                            Icons.local_pizza,
                            Colors.green,
                          ),
                          MacroRow(
                            "Grasas",
                            "14/80g",
                            Icons.fastfood,
                            Colors.orange,
                          ),
                          MacroRow("Fibra", "8/30g", Icons.eco, Colors.purple),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// Comidas
              const Text(
                "Comidas",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _mealItem("Pollo a la plancha con quinoa", "426 kcal"),
              _mealItem("Yogur con frutas", "280 kcal"),
              _mealItem("Ensalada mixta", "150 kcal"),
            ],
          ),
        ),
      ),
    );
  }

  /// Widgets auxiliares
  static Widget _summaryCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  static Widget _mealItem(String title, String kcal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(kcal, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class MacroRow extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const MacroRow(this.title, this.value, this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Expanded(child: Text(title)),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
