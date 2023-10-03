import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Anggota_Models.dart';
import 'DatabaseHelper.dart';

void main() {
  runApp(Anggota());
}

class Anggota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Susunan Keanggotaan PKK',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: AnggotaList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnggotaList extends StatefulWidget {
  @override
  _AnggotaListState createState() => _AnggotaListState();
}

class _AnggotaListState extends State<AnggotaList> {
  // Buat sebuah Map untuk menyimpan status hadir setiap anggota
  Map<String, bool> hadirAnggota = {};

  @override
  void initState() {
    super.initState();
    _loadHadirAnggota(); // Memuat data anggota yang sudah disimpan
  }

  Future<void> _loadHadirAnggota() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hadirAnggota = prefs.getString('hadirAnggota') != null
          ? Map<String, bool>.from(
              Map<String, dynamic>.from(
                prefs.getString('hadirAnggota')! as Map,
              ),
            )
          : {};
    });
  }

  Future<void> _saveHadirAnggota() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('hadirAnggota', hadirAnggota.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Susunan Keanggotaan PKK'),
      ),
      body: ListView(
        children: [
          _buildSection(
              'Penghayatan dan Pengamalan Pancasila dan Gotong Royong', [
            _buildAnggota('POKJA I', 'KETUA', 'CARMELINDA CARVALHO'),
            _buildAnggota('POKJA I', 'WAKIL', 'LUH PUTU WARINI'),
            _buildAnggota('POKJA I', 'SEKRETARIS', 'MADE SUSARI DEWI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'NI LUH KARONI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'LUH SRI NADI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'PUTU BUDARI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'MADE SUASTINI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'KADEK SINTAWATI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'LUH SUKERINI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'LUH DARMIYANTI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'NYOMAN WILIANI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'LUH SUKARMIADI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'KADEK ARYANTINI'),
            _buildAnggota('POKJA I', 'ANGGOTA', 'KOMANG DARINI'),
          ]),
          _buildSection(
              'Pendidikan, Keterampilan, dan Pengembangan Kehidupan Berkoperasi',
              [
                _buildAnggota('POKJA II', 'KETUA', 'I KETUT MEGAWATI'),
                _buildAnggota('POKJA II', 'WAKIL', 'KADEK SUPARTI'),
                _buildAnggota('POKJA II', 'SEKRETARIS', 'NI MADE JERO'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'PUTU ENI ARWATI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'NI MADE WARTINI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'NI KOMANG SUKERTI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'DESAK SULASTRI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'PUTU KAWI'),
                _buildAnggota(
                    'POKJA II', 'ANGGOTA', 'KETUT ESTI SETIA PURNAMA DEWI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'MADE DWITTARI PANDE'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'NI KOMANG BUDIKERTIASIH'),
                _buildAnggota(
                    'POKJA II', 'ANGGOTA', 'NI LUH PUTU ERNA PURNAMA WARDANI'),
                _buildAnggota('POKJA II', 'ANGGOTA', 'LUH MINI'),
              ]),
          _buildSection(
              'Pangan, Sandang, Perumahan, dan Tata Laksana Rumah Tangga', [
            _buildAnggota('POKJA III', 'KETUA', 'NI LUH DURIANI PANDE'),
            _buildAnggota('POKJA III', 'WAKIL', 'LUH SWINADI'),
            _buildAnggota('POKJA III', 'SEKRETARIS', 'KOMANG DESY ARIANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'MADE BUDIAYU'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KADEK PURNAMI'),
            _buildAnggota(
                'POKJA III', 'ANGGOTA', 'NI KADEK ELFIRA MEIROSA PERASI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KETUT KARTIKA'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KETUT EVIN HANDAYANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KOMANG ARIANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KETUT SUANDAYANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'JRO NYOMAN SUDARBI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KADEK DEWI INDRAYANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KETUT SETIA WATI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'GUSTI AYU DEWI PUJAYANI'),
            _buildAnggota('POKJA III', 'ANGGOTA', 'KOMANG SITI SURYANI'),
          ]),
          _buildSection(
              'Kesehatan, Kelestarian Lingkungan Hidup, dan Perencanaan Kesehatan',
              [
                _buildAnggota('POKJA IV', 'KETUA', 'LUH ALIT MAHENDRA WATI'),
                _buildAnggota('POKJA IV', 'WAKIL', 'KADEK SUARTINI'),
                _buildAnggota('POKJA IV', 'SEKRETARIS', 'KOMANG INTAN SURYANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KADEK DESY ARISANDI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'LUH ANITA'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'LUH BUDIARTINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KOMANG SUARDENI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KOMANG ASRINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'GUSTI AYU KETUT ARMENI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'NYOMAN SARIANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'WAYAN KARINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'NI KADEK RASMINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KOMANG ARDIANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'LUH JULIANTINI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KADEK DESI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'LUH SETIANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KETUT SUANDA YANI'),
                _buildAnggota('POKJA IV', 'ANGGOTA', 'KADEK SUARMINI'),
              ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Buka halaman penyimpanan data saat tombol "Simpan" ditekan
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SimpanDataPage(
                hadirAnggota: hadirAnggota,
                onSave: _saveHadirAnggota,
              ),
            ),
          );
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> anggotaList) {
    return Padding(
      padding: const EdgeInsets.all(
          8.0), // Atur padding di sini sesuai kebutuhan Anda
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey, // Ganti warna sesuai keinginan Anda
            ),
          ),
          Column(
            children: anggotaList,
          ),
        ],
      ),
    );
  }

  Widget _buildAnggota(String pokja, String jabatan, String nama) {
    // Dapatkan status hadir dan tidak hadir dari Map berdasarkan nama anggota
    bool hadir = hadirAnggota[nama] ?? false;
    bool tidakHadir = !hadir;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          jabatan,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14, // Ganti ukuran font sesuai keinginan Anda
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              nama,
              style: TextStyle(
                fontSize: 10, // Ganti ukuran font sesuai keinginan Anda
              ),
            ),
            SizedBox(width: 10),
            Checkbox(
              value: hadir,
              onChanged: (bool? newValue) {
                // Saat checkbox hadir diubah, panggil setState untuk memperbarui UI
                setState(() {
                  hadirAnggota[nama] = newValue ?? false; // Simpan status hadir
                });
              },
            ),
            Text("Hadir"),
            SizedBox(width: 12),
            Checkbox(
              value: tidakHadir,
              onChanged: (bool? newValue) {
                // Saat checkbox tidak hadir diubah, panggil setState untuk memperbarui UI
                setState(() {
                  hadirAnggota[nama] = !newValue!; // Simpan status tidak hadir
                });
              },
            ),
            Text("Tidak Hadir"),
          ],
        ),
        trailing: Text(
          pokja,
          style: TextStyle(
            fontSize: 12, // Ganti ukuran font sesuai keinginan Anda
          ),
        ),
      ),
    );
  }
}

class SimpanDataPage extends StatelessWidget {
  final Map<String, bool> hadirAnggota;
  final Function onSave;

  SimpanDataPage({
    required this.hadirAnggota,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simpan Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Data Anggota yang Disimpan:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            // Tampilkan data anggota yang disimpan di sini
            Column(
              children: hadirAnggota.entries
                  .map(
                    (entry) => ListTile(
                      title: Text(entry.key),
                      subtitle: Text(entry.value ? 'Hadir' : 'Tidak Hadir'),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                onSave(); // Simpan data ke SharedPreferences
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
