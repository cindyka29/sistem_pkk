import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Iuran_Models.dart';
import 'iuran.dart'; // Pastikan ini mengimpor file iuran.dart yang berisi IuranPage.

class InputIuranPage extends StatefulWidget {
  @override
  _InputIuranPageState createState() => _InputIuranPageState();
}

class _InputIuranPageState extends State<InputIuranPage> {
  double totalKeuangan = 0.0; // Inisialisasikan dengan nilai awal yang sesuai
  final TextEditingController namaController = TextEditingController();
  String? selectedKegiatan;
  double nominalUang = 0.0;
  File? buktiPembayaran;
  final picker = ImagePicker();

  final List<String> jenisKegiatanOptions = [
    'Bersih-bersih',
    '17 Agustus',
    'Makan-makan',
    'Arisan',
  ];

  String formatRupiah(int nominal) {
    String rupiah = nominal.toString();
    String result = '';
    int count = 0;
    for (int i = rupiah.length - 1; i >= 0; i--) {
      result = rupiah[i] + result;
      count++;
      if (count == 3 && i > 0) {
        result = '.' + result;
        count = 0;
      }
    }
    return 'Rp $result.000';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Iuran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            DropdownButtonFormField<String>(
              value: selectedKegiatan,
              onChanged: (value) {
                setState(() {
                  selectedKegiatan = value;
                });
              },
              items: jenisKegiatanOptions.map((kegiatan) {
                return DropdownMenuItem<String>(
                  value: kegiatan,
                  child: Text(kegiatan),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Jenis Kegiatan'),
            ),
            SizedBox(
              height: 16,
            ), // Tambahkan padding di antara elemen-elemen ini
            Text('Nominal Uang: ${formatRupiah(nominalUang.round())}'),
            Slider(
              value: nominalUang,
              min: 0,
              max: 500,
              onChanged: (value) {
                setState(() {
                  nominalUang = value;
                });
              },
              label:
                  'Nominal Uang: ${formatRupiah(nominalUang.round())}', // Ubah label
              divisions: 500,
            ),
            SizedBox(
              height: 16,
            ), // Tambahkan padding di antara elemen-elemen ini
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  setState(() {
                    buktiPembayaran = File(pickedFile.path);
                  });
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt), // Tambahkan ikon kamera di sini
                  SizedBox(width: 8), // Beri jarak antara ikon dan teks
                  Text('Unggah Gambar/Bukti Pembayaran'),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ), // Tambahkan padding di antara elemen-elemen ini
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final String nama = namaController.text;
                  final String jenisKegiatan = selectedKegiatan ?? '';
                  final int nominalUangInt = nominalUang.round();
                  final String? buktiPembayaranPath = buktiPembayaran?.path;

                  // Tambahkan nilai nominalUangInt ke totalKeuangan
                  totalKeuangan += nominalUangInt.toDouble();

                  final iuran = Iuran(
                    nama: nama,
                    jenisKegiatan: jenisKegiatan,
                    nominalUang: nominalUangInt,
                    buktiPembayaranPath: buktiPembayaranPath,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IuranPage(
                        iuran: iuran,
                        buktiPembayaran: buktiPembayaranPath,
                        totalKeuangan:
                            totalKeuangan, // Kirim totalKeuangan ke IuranPage
                      ),
                    ),
                  );
                },
                child: Text('Simpan Data Keuangan'),
              ),
            ),
          ],
        ),
      ),
      // Hapus FloatingActionButton
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
