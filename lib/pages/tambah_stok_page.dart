import 'package:flutter/material.dart';
import '../models/stok_model.dart';

class TambahStokPage extends StatefulWidget {
  const TambahStokPage({super.key});

  @override
  State<TambahStokPage> createState() => _TambahStokPageState();
}

class _TambahStokPageState extends State<TambahStokPage> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final jumlahController = TextEditingController();
  final satuanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Stok'),
        backgroundColor: Colors.amber.shade600,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  prefixIcon: const Icon(Icons.inventory_2_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Nama barang wajib diisi' : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jumlah',
                  prefixIcon: const Icon(Icons.format_list_numbered),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Jumlah wajib diisi' : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: satuanController,
                decoration: InputDecoration(
                  labelText: 'Satuan (contoh: pcs, box)',
                  prefixIcon: const Icon(Icons.category_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save_alt_rounded),
                  label: const Text('Simpan Stok'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final stokBaru = Stok(
                        namaBarang: namaController.text,
                        jumlah: int.parse(jumlahController.text),
                        satuan: satuanController.text,
                      );
                      Navigator.pop(context, stokBaru);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
