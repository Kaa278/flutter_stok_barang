import 'package:flutter/material.dart';
import '../models/stok_model.dart';
import '../pages/tambah_stok_page.dart';
import '../widgets/stok_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Stok> daftarStok = [];

  void tambahStokBaru(Stok stokBaru) {
    setState(() {
      daftarStok.add(stokBaru);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        title: const Text('📦 Tes Stok Barang'),
        centerTitle: true,
        backgroundColor: Colors.amber.shade600,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: daftarStok.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada stok barang.\nTekan tombol + untuk menambah.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: daftarStok.length,
                itemBuilder: (context, index) {
                  return StokCard(stok: daftarStok[index]);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber.shade700,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Tambah', style: TextStyle(color: Colors.white)),
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahStokPage()),
          );
          if (hasil != null && hasil is Stok) tambahStokBaru(hasil);
        },
      ),
    );
  }
}
