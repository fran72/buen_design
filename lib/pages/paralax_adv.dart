import 'package:flutter/material.dart';

class ParallaxAdvPage extends StatefulWidget {
  const ParallaxAdvPage({super.key});

  @override
  State<ParallaxAdvPage> createState() => _ParallaxCardsPageState();
}

class _ParallaxCardsPageState extends State<ParallaxAdvPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(title: const Text('Mercadillo')),
      body: ListView.builder(
        controller: _controller,
        itemCount: demoItems.length,
        itemBuilder: (context, index) {
          return ParallaxCard(
            controller: _controller,
            index: index,
            item: demoItems[index],
          );
        },
      ),
    );
  }
}

class ParallaxCard extends StatelessWidget {
  final ScrollController controller;
  final int index;
  final DemoItem item;

  const ParallaxCard({
    super.key,
    required this.controller,
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    const cardHeight = 220.0;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double offset = 0;

        if (controller.hasClients) {
          offset = controller.offset - index * cardHeight;
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: cardHeight,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Transform.translate(
                    offset: Offset(0, offset * 0.15), // <-- PARALLAX REAL
                    child: Image.network(item.imageUrl, fit: BoxFit.cover),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black38],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.price,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DemoItem {
  final String title;
  final String price;
  final String imageUrl;

  DemoItem({required this.title, required this.price, required this.imageUrl});
}

final demoItems = [
  DemoItem(
    title: 'iPhone 13 Pro',
    price: '650 €',
    imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
  ),
  DemoItem(
    title: 'Bici urbana',
    price: '180 €',
    imageUrl: 'https://images.unsplash.com/photo-1509395176047-4a66953fd231',
  ),
  DemoItem(
    title: 'MacBook Air M1',
    price: '820 €',
    imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
  ),
  DemoItem(
    title: 'iPhone 13 Pro',
    price: '650 €',
    imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
  ),
  DemoItem(
    title: 'Bici urbana',
    price: '180 €',
    imageUrl: 'https://images.unsplash.com/photo-1509395176047-4a66953fd231',
  ),
  DemoItem(
    title: 'MacBook Air M1',
    price: '820 €',
    imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
  ),
  DemoItem(
    title: 'iPhone 13 Pro',
    price: '650 €',
    imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
  ),
  DemoItem(
    title: 'Bici urbana',
    price: '180 €',
    imageUrl: 'https://images.unsplash.com/photo-1509395176047-4a66953fd231',
  ),
  DemoItem(
    title: 'MacBook Air M1',
    price: '820 €',
    imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
  ),
];
