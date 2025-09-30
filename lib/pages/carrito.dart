import 'package:flutter/material.dart';

class CarritoPage extends StatelessWidget {
  const CarritoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"name": "Jordan Nike", "price": "210.000 ₡", "img": "👟"},
      {"name": "Zapatos Adidas Blancos", "price": "210.000 ₡", "img": "👟"},
      {
        "name": "Camiseta Nike de varios colores",
        "price": "210.000 ₡",
        "img": "👕",
      },
      {"name": "Camisetas Adidas", "price": "210.000 ₡", "img": "👕"},
      {"name": "Zapatos Puma rojos", "price": "210.000 ₡", "img": "👟"},
      {"name": "Zapatos Adidas Classics", "price": "210.000 ₡", "img": "👟"},
      {"name": "Jordan Seguros", "price": "210.000 ₡", "img": "👟"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi orden"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = items[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen (simulada con emoji por simplicidad)
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(item["img"]!, style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 12),

              // Nombre + cantidad
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["name"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const Text("1"),
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Precio
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item["price"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          );
        },
      ),

      // Footer con total + botón
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                "TOTAL: 1.267.000 ₡",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "CONFIRMAR ORDEN",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
