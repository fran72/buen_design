import 'package:flutter/material.dart';

class AdeslasPage extends StatelessWidget {
  const AdeslasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              const SizedBox(height: 20),
              _SearchBar(),
              const SizedBox(height: 24),
              _SectionTitle(title: 'Category'),
              const SizedBox(height: 12),
              _Categories(),
              const SizedBox(height: 24),
              _CourseHorizontalList(),
              const SizedBox(height: 24),
              _SectionTitle(title: 'Popular Course'),
              const SizedBox(height: 12),
              _PopularCoursesGrid(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Choose your', style: TextStyle(color: Colors.grey)),
            Text(
              'Design Course',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.orange.shade100,
          child: const Icon(Icons.person, color: Colors.orange),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for course',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}

// class _Categories extends StatelessWidget {
//   final categories = const ['UI/UX', 'Coding', 'Basic UI'];

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: categories.map((e) {
//         final selected = e == 'UI/UX';
//         return Padding(
//           padding: const EdgeInsets.only(right: 10),
//           child: Chip(
//             label: Text(e),
//             backgroundColor: selected ? Colors.blue : Colors.white,
//             labelStyle: TextStyle(
//               color: selected ? Colors.white : Colors.black,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

class _Categories extends StatefulWidget {
  @override
  State<_Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<_Categories> {
  final categories = const ['UI/UX', 'Coding', 'Basic UI'];
  String selectedCategory = 'UI/UX';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.map((e) {
        final selected = e == selectedCategory;

        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ChoiceChip(
            label: Text(e),
            selected: selected,
            selectedColor: Colors.blue,
            backgroundColor: Colors.white,
            shape: StadiumBorder(
              side: BorderSide(
                color: selected ? Colors.blue : Colors.grey.shade300,
              ),
            ),
            labelStyle: TextStyle(
              color: selected ? Colors.white : Colors.black,
            ),
            onSelected: (_) {
              setState(() {
                selectedCategory = e;
              });
            },
          ),
        );
      }).toList(),
    );
  }
}

class _CourseHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return Container(
            width: 180,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.design_services,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'User Interface\nDesign',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                const Text(
                  '24 lesson  •  4.3 ★',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '\$25',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, size: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PopularCoursesGrid extends StatelessWidget {
  final Size size;
  const _PopularCoursesGrid({required this.size});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = size.width > 600 ? 3 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (_, __) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.web, size: 40, color: Colors.orange),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Web Design\nCourse',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              const Text(
                '24 lesson  •  4.3 ★',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
