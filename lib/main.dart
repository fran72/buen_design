import 'package:buen_design/pages/caixa.dart';
import 'package:buen_design/pages/carrito.dart';
import 'package:buen_design/pages/carrito_wallapop.dart';
import 'package:buen_design/pages/habanero.dart';
import 'package:buen_design/pages/home.dart';
import 'package:buen_design/pages/moncofar.dart';
import 'package:buen_design/pages/scan_cal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // ColorScheme principal de la app
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0, // sin sombra
          centerTitle: true, // opcional, centra el título
          surfaceTintColor: Colors.white, // importante
        ),

        // Botón flotante púrpura
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),

        // Botones elevados púrpura
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
        ),

        // InputDecoration (formularios) con acento púrpura
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
        ),
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => const HomePage(),
        'moncofar': (BuildContext context) => const MoncofarPage(),
        'carrito': (BuildContext context) => const CarritoPage(),
        'scan_cal': (BuildContext context) => const ScanCalPage(),
        'habanero': (BuildContext context) => const HabaneroPage(),
        'caixa': (BuildContext context) => const CaixaPage(),
        'carrito_wallapop': (BuildContext context) =>
            const CarritoWallapopPage(),
      },
    );
  }
}
