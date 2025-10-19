import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const StokApp());
}

class StokApp extends StatelessWidget {
  const StokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tes Stok Barang',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}
