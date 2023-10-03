import 'dart:io';
import 'package:flutter/material.dart';
import 'Iuran_Models.dart';

class IuranPage extends StatelessWidget {
  final Iuran iuran;
  final String? buktiPembayaran;
  final double totalKeuangan; // Tambahkan totalKeuangan sebagai parameter

  IuranPage(
      {required this.iuran,
      this.buktiPembayaran,
      required this.totalKeuangan}); // Tambahkan totalKeuangan di konstruktor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Iuran'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${iuran.nama}'),
            Text('Jenis Kegiatan: ${iuran.jenisKegiatan}'),
            Text('Nominal Uang: Rp ${iuran.nominalUang.toString()}.000'),
            // Text('Nominal Uang: ${iuran.nominalUang.toString()}'),
            // Tampilkan gambar bukti pembayaran jika ada
            if (buktiPembayaran != null)
              Image.file(
                File(buktiPembayaran!), // Ubah path ke File
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ElevatedButton(
              onPressed: () {
                // Tampilkan total keuangan di sini
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Total Keuangan'),
                      content: Text(
                          'Rp ${totalKeuangan.toStringAsFixed(2)}0'), // Menampilkan totalKeuangan dalam format Rupiah
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child:
                  Text('Total Dana: Rp ${totalKeuangan.toStringAsFixed(2)}0'),
            ),
          ],
        ),
      ),
    );
  }
}
