import 'package:flutter/material.dart';

class CarritoWallapopRealPage extends StatelessWidget {
  const CarritoWallapopRealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "name": "Jordan Nike",
        "price": "210.000 ₡",
        "img":
            "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/95eaa8b3-0b64-45ab-b0c0-6d08c827e3e2/air-jordan-1-retro-high-og-zapatillas.png",
      },
      {
        "name": "Zapatos Adidas Blancos",
        "price": "210.000 ₡",
        "img":
            "https://assets.adidas.com/images/w_600,f_auto,q_auto/1b9c6d03b4e445eebf48ac4400a05b7f_9366/Stan_Smith_Zapatillas_Blanco_FX5502_01_standard.jpg",
      },
      {
        "name": "Camiseta Nike colores",
        "price": "210.000 ₡",
        "img":
            "https://static.nike.com/a/images/t_default/7a5e5b39-0792-4561-bd6a-f6d026a76f63/camiseta-sportswear-club-hombre.png",
      },
      {
        "name": "Camisetas Adidas",
        "price": "210.000 ₡",
        "img":
            "https://assets.adidas.com/images/w_600,f_auto,q_auto/7d25f66e2f63491e9e75ae35012b5c94_9366/Camiseta_Essentials_Logo_Negro_HS3530_01_laydown.jpg",
      },
      {
        "name": "Zapatos Puma rojos",
        "price": "210.000 ₡",
        "img":
            "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/380190/07/sv01/fnd/PNA/fmt/png",
      },
      {
        "name": "Zapatos Adidas Classics",
        "price": "210.000 ₡",
        "img":
            "https://assets.adidas.com/images/w_600,f_auto,q_auto/ea2e20f23f374c4c9b08ac8900bc6d8c_9366/Forum_Low_Zapatillas_Blanco_FY7756_01_standard.jpg",
      },
      {
        "name": "Jordan Seguros",
        "price": "210.000 ₡",
        "img":
            "https://static.nike.com/a/images/t_default/6c08d59d-c72c-4ff0-8e41-09aacae64d20/air-jordan-3-retro-zapatillas.png",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi orden"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade100,

      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 3,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Imagen del producto
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      item["img"]!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Info producto
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            _qtyButton(Icons.remove),
                            const SizedBox(width: 8),
                            const Text(
                              "1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            _qtyButton(Icons.add),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Precio y delete
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        item["price"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // Footer con total y botón
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "TOTAL: 1.267.000 ₡",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
              onPressed: () {},
              child: const Text(
                "Confirmar orden",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _qtyButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400),
        color: Colors.white,
      ),
      child: IconButton(
        icon: Icon(icon, size: 18, color: Colors.grey.shade700),
        onPressed: () {},
        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
