import 'package:flutter/material.dart';

class CaixaPage extends StatelessWidget {
  const CaixaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: _buildBottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildTopIcons(),
              const SizedBox(height: 20),
              _buildQuickActions(),
              const SizedBox(height: 30),
              _buildSectionHeader("Cuentas"),
              const SizedBox(height: 10),
              _buildCuentaCard("Antes cta .....6601", "15,60€"),
              const SizedBox(height: 12),
              _buildCuentaCard("Antes cta .....8729", "0,56€"),
              const SizedBox(height: 30),
              _buildSectionHeader("Tarjetas"),
              const SizedBox(height: 10),
              _buildTarjetaCard("Pago Flexible"),
              const SizedBox(height: 12),
              _buildTarjetaCard("Debit"),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- TOP ICONS --------------------
  Widget _buildTopIcons() {
    return Row(
      children: [
        // Image.network(
        //   "https://upload.wikimedia.org/wikipedia/commons/1/14/CaixaBank_Logo.png",
        //   width: 40,
        // ),
        const Text(
          "CaixaBank",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const Spacer(),
        const Icon(Icons.lock_clock_outlined),
        const SizedBox(width: 15),
        const Icon(Icons.mail_outline),
        const SizedBox(width: 15),
        const Icon(Icons.remove_red_eye_outlined),
        const SizedBox(width: 15),
        const CircleAvatar(
          backgroundColor: Colors.black,
          child: Text("FL", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  // ---------------- QUICK ACTIONS --------------------
  Widget _buildQuickActions() {
    final actions = [
      {"icon": Icons.send, "label": "Bizum"},
      {"icon": Icons.sync_alt, "label": "Transferencia"},
      {"icon": Icons.receipt_long, "label": "Recibos"},
      {"icon": Icons.person_outline, "label": "Contactar"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: actions
          .map(
            (a) => Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blue,
                  child: Icon(a["icon"] as IconData, color: Colors.white),
                ),
                const SizedBox(height: 6),
                Text(a["label"] as String),
              ],
            ),
          )
          .toList(),
    );
  }

  // ---------------- SECTION HEADER --------------------
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Ver todas",
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ---------------- CUENTA CARD --------------------
  Widget _buildCuentaCard(String title, String amount) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 6),
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  // ---------------- TARJETA CARD --------------------
  Widget _buildTarjetaCard(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(width: 40, height: 25, color: Colors.orangeAccent),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  // ---------------- BOTTOM NAV BAR --------------------
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: "Mis productos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: "Contratar",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: "Ayuda"),
      ],
    );
  }
}
