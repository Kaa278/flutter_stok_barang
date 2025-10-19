import 'package:flutter/material.dart';
import '../models/stok_model.dart';

class StokCard extends StatelessWidget {
  final Stok stok;

  const StokCard({super.key, required this.stok});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber.shade700,
          child: const Icon(Icons.inventory, color: Colors.white),
        ),
        title: Text(
          stok.namaBarang,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Jumlah: ${stok.jumlah} ${stok.satuan}'),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
