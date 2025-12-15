import 'package:flutter/material.dart';

class CityXerpaPage extends StatelessWidget {
  const CityXerpaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.green,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFFFF5A5F)),
            ),
            Column(
              children: [
                _Header(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _CategoriesGrid(),
                          const SizedBox(height: 24),
                          _SectionTitle(
                            title: 'Destacats 💥',
                            subtitle: 'Els millors de la setmana!',
                          ),
                          const SizedBox(height: 12),
                          _FeaturedList(size: size),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: const BoxDecoration(
        color: Color(0xFFFF5A5F),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'On t’ho lliurem?',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              SizedBox(height: 4),
              Text(
                'Carrer Pau Casals 5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
              SizedBox(width: 12),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Color(0xFFFF5A5F)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoriesGrid extends StatelessWidget {
  final categories = const [
    {'icon': Icons.local_pizza, 'label': 'Menjar', 'color': Colors.green},
    {'icon': Icons.shopping_cart, 'label': 'Súper', 'color': Colors.black45},
    {
      'icon': Icons.directions_car,
      'label': 'Move',
      'color': Colors.greenAccent,
    },
    {'icon': Icons.store, 'label': 'Botigues', 'color': Colors.deepOrange},
    {'icon': Icons.flash_on, 'label': 'Experiències', 'color': Colors.yellow},
    {'icon': Icons.local_shipping, 'label': 'Enviaments', 'color': Colors.pink},
    {
      'icon': Icons.local_hospital,
      'label': 'Farmàcia',
      'color': Colors.deepPurple,
    },
    {
      'icon': Icons.chat_bubble,
      'label': 'El que vulguis',
      'color': Colors.blue,
    },
    {'icon': Icons.pets, 'label': 'Mascotes', 'color': Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 600 ? 4 : 3;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85, // aqui ajusta el alto de la columna
      ),
      itemBuilder: (context, index) {
        final item = categories[index];

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 95, // aqui ajusta el alto de lo gris dentro de la columna
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                item['icon'] as IconData,
                size: 36,
                color: item['color'] as Color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item['label'] as String,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.black, fontSize: 13),
        ),
      ],
    );
  }
}

class _FeaturedList extends StatelessWidget {
  final Size size;
  const _FeaturedList({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return Container(
            width: size.width * 0.65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image(
                      image: AssetImage('../assets/cityxerpa/$index.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'PaniPunto',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '2,50 €  •  20 - 30 min',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
